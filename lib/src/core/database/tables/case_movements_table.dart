import 'package:drift/drift.dart';
import 'package:shadprocess/src/core/database/tables/legal_case_table.dart';

class CaseMovements extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get legalCaseId =>
      integer().references(LegalCases, #id, onDelete: KeyAction.cascade)();

  DateTimeColumn get movementDate => dateTime()();
  TextColumn get description => text()();
  TextColumn get responsible => text()();
}
