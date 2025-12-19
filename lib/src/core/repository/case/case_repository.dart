// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:drift/drift.dart';
import '../../database/database.dart';

class DashboardMetrics {
  final int total;
  final int active;
  final int archived;
  final int finished;
  final Map<String, int> byType;
  final List<CaseListItem> upcomingDeadlines;
  final int highPriorityCount;

  DashboardMetrics({
    required this.total,
    required this.active,
    required this.archived,
    required this.finished,
    required this.byType,
    required this.upcomingDeadlines,
    required this.highPriorityCount,
  });
}

class CaseListItem {
  final LegalCase legalCase;
  final String mainPartyName;

  CaseListItem({required this.legalCase, required this.mainPartyName});
}

class CaseRepository {
  final AppDatabase db;

  CaseRepository(this.db);

  /// ADICIONADO: Método para fornecer contexto detalhado ao Gemini
  Future<List<Map<String, dynamic>>> getDetailedCasesContext() async {
    final query = db.select(db.legalCases).join([
      leftOuterJoin(
        db.mainParties,
        db.mainParties.legalCaseId.equalsExp(db.legalCases.id),
      ),
      leftOuterJoin(
        db.opposingParties,
        db.opposingParties.legalCaseId.equalsExp(db.legalCases.id),
      ),
      leftOuterJoin(
        db.caseDates,
        db.caseDates.legalCaseId.equalsExp(db.legalCases.id),
      ),
    ]);

    final rows = await query.get();

    return rows.map((row) {
      final legalCase = row.readTable(db.legalCases);
      final mainParty = row.readTableOrNull(db.mainParties);
      final opposingParty = row.readTableOrNull(db.opposingParties);
      final dates = row.readTableOrNull(db.caseDates);

      return {
        'case_number': legalCase.caseNumber,
        'type': legalCase.caseType,
        'area': legalCase.area,
        'status': legalCase.status,
        'client_name': mainParty?.name ?? 'Not informed',
        'opposing_party': opposingParty?.name ?? 'Not informed',
        'next_deadline': dates?.nextDeadline.toIso8601String(),
        'deadline_description': dates?.deadlineDescription ?? 'N/A',
        'court': legalCase.court,
        'priority': legalCase.priority,
      };
    }).toList();
  }

  Future<List<LegalCase>> getAvailableCases() async {
    return await db.select(db.legalCases).get();
  }

  Future<DashboardMetrics> getDashboardMetrics() async {
    final allCases = await db.select(db.legalCases).get();

    int active = 0;
    int archived = 0;
    int finished = 0;
    int highPriority = 0;
    final Map<String, int> typeMap = {};

    for (var c in allCases) {
      final status = c.status.toLowerCase();
      final priority = c.priority.toLowerCase();

      if (status == 'ativo' || status == 'em andamento')
        active++;
      else if (status == 'arquivado')
        archived++;
      else if (status == 'encerrado' || status == 'concluído')
        finished++;

      if (priority.contains('alta') || priority.contains('urgente'))
        highPriority++;

      typeMap[c.caseType] = (typeMap[c.caseType] ?? 0) + 1;
    }

    final now = DateTime.now();
    final nextWeek = now.add(const Duration(days: 7));

    final queryDeadlines =
        db.select(db.legalCases).join([
            innerJoin(
              db.mainParties,
              db.mainParties.legalCaseId.equalsExp(db.legalCases.id),
            ),
            innerJoin(
              db.caseDates,
              db.caseDates.legalCaseId.equalsExp(db.legalCases.id),
            ),
          ])
          ..where(
            db.caseDates.nextDeadline.isBetweenValues(
              now.subtract(const Duration(days: 1)),
              nextWeek,
            ),
          )
          ..orderBy([OrderingTerm(expression: db.caseDates.nextDeadline)]);

    final rows = await queryDeadlines.get();

    final deadlinesList = rows.map((row) {
      return CaseListItem(
        legalCase: row.readTable(db.legalCases),
        mainPartyName: row.readTable(db.mainParties).name,
      );
    }).toList();

    return DashboardMetrics(
      total: allCases.length,
      active: active,
      archived: archived,
      finished: finished,
      byType: typeMap,
      upcomingDeadlines: deadlinesList,
      highPriorityCount: highPriority,
    );
  }

  Future<List<CaseListItem>> getCasesByDate(DateTime date) async {
    final start = DateTime(date.year, date.month, date.day);
    final end = start.add(const Duration(days: 1));

    final query = db.select(db.legalCases).join([
      innerJoin(
        db.mainParties,
        db.mainParties.legalCaseId.equalsExp(db.legalCases.id),
      ),
    ])..where(db.legalCases.startDate.isBetweenValues(start, end));

    final rows = await query.get();

    return rows.map((row) {
      return CaseListItem(
        legalCase: row.readTable(db.legalCases),
        mainPartyName: row.readTable(db.mainParties).name,
      );
    }).toList();
  }

  Future<void> saveFromDraft(Map<String, dynamic> draft) async {
    await db.transaction(() async {
      final stepOne = draft['stepOne'];
      final stepTwo = draft['stepTwo'];
      final stepThree = draft['stepThree'];

      final legalCaseId = await db
          .into(db.legalCases)
          .insert(
            LegalCasesCompanion.insert(
              caseNumber: stepOne['legalCase']['caseNumber'],
              caseType: stepOne['legalCase']['caseType'],
              area: stepOne['legalCase']['area'],
              court: stepOne['legalCase']['court'],
              jurisdiction: stepOne['legalCase']['jurisdiction'],
              status: stepOne['legalCase']['status'],
              priority: stepOne['legalCase']['priority'],
              startDate: DateTime.parse(stepOne['legalCase']['startDate']),
              expectedEndDate: stepOne['legalCase']['expectedEndDate'] == null
                  ? const Value.absent()
                  : Value(
                      DateTime.parse(stepOne['legalCase']['expectedEndDate']),
                    ),
            ),
          );

      await db
          .into(db.mainParties)
          .insert(
            MainPartiesCompanion.insert(
              legalCaseId: legalCaseId,
              name: stepOne['mainParty']['name'],
              role: stepOne['mainParty']['role'],
              taxId: stepOne['mainParty']['taxId'] == null
                  ? const Value.absent()
                  : Value(stepOne['mainParty']['taxId']),
            ),
          );

      await db
          .into(db.opposingParties)
          .insert(
            OpposingPartiesCompanion.insert(
              legalCaseId: legalCaseId,
              name: stepOne['opposingParty']['name'],
              taxId: stepOne['opposingParty']['taxId'] == null
                  ? const Value.absent()
                  : Value(stepOne['opposingParty']['taxId']),
            ),
          );

      await db
          .into(db.caseDates)
          .insert(
            CaseDatesCompanion.insert(
              legalCaseId: legalCaseId,
              lastMovementDate: DateTime.parse(
                stepTwo['caseDates']['lastMovementDate'],
              ),
              nextDeadline: DateTime.parse(
                stepTwo['caseDates']['nextDeadline'],
              ),
              deadlineDescription: stepTwo['caseDates']['deadlineDescription'],
              hearingDate: stepTwo['caseDates']['hearingDate'] == null
                  ? const Value.absent()
                  : Value(DateTime.parse(stepTwo['caseDates']['hearingDate'])),
              hearingType: stepTwo['caseDates']['hearingType'] == null
                  ? const Value.absent()
                  : Value(stepTwo['caseDates']['hearingType']),
            ),
          );

      for (final m in stepTwo['movements']) {
        await db
            .into(db.caseMovements)
            .insert(
              CaseMovementsCompanion.insert(
                legalCaseId: legalCaseId,
                movementDate: DateTime.parse(m['movementDate']),
                description: m['description'],
                responsible: m['responsible'],
              ),
            );
      }

      await db
          .into(db.legalRepresentatives)
          .insert(
            LegalRepresentativesCompanion.insert(
              legalCaseId: legalCaseId,
              name: stepThree['legalRepresentative']['name'],
              barNumber: stepThree['legalRepresentative']['barNumber'],
              contact: stepThree['legalRepresentative']['contact'],
            ),
          );

      for (final d in stepThree['documents']) {
        await db
            .into(db.caseDocuments)
            .insert(
              CaseDocumentsCompanion.insert(
                legalCaseId: legalCaseId,
                documentType: d['documentType'],
                documentDate: DateTime.parse(d['documentDate']),
                notes: d['notes'] == null
                    ? const Value.absent()
                    : Value(d['notes']),
                filePath: d['filePath'],
              ),
            );
      }
    });
  }
}
