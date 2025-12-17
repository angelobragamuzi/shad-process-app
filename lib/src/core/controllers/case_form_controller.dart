import 'dart:convert';
import 'package:shadprocess/src/core/repository/case_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CaseFormController {
  static const String _draftKey = 'case_form_draft';

  final CaseRepository repository;

  CaseFormController(this.repository);

  Future<void> saveStepOne({
    required String caseNumber,
    required String caseType,
    required String area,
    required String court,
    required String jurisdiction,
    required String status,
    required String priority,
    required DateTime startDate,
    DateTime? expectedEndDate,
    required String mainPartyName,
    required String mainPartyRole,
    String? mainPartyTaxId,
    required String opposingPartyName,
    String? opposingPartyTaxId,
  }) async {
    final draft = await _getDraft();

    draft['stepOne'] = {
      "legalCase": {
        "caseNumber": caseNumber,
        "caseType": caseType,
        "area": area,
        "court": court,
        "jurisdiction": jurisdiction,
        "status": status,
        "priority": priority,
        "startDate": startDate.toIso8601String(),
        "expectedEndDate": expectedEndDate?.toIso8601String(),
      },
      "mainParty": {
        "name": mainPartyName,
        "role": mainPartyRole,
        "taxId": mainPartyTaxId?.isEmpty ?? true ? null : mainPartyTaxId,
      },
      "opposingParty": {
        "name": opposingPartyName,
        "taxId": opposingPartyTaxId?.isEmpty ?? true
            ? null
            : opposingPartyTaxId,
      },
    };

    await _saveDraft(draft);
  }

  Future<void> saveStepTwo({
    required DateTime lastMovementDate,
    required DateTime nextDeadline,
    required String deadlineDescription,
    DateTime? hearingDate,
    String? hearingType,
    required DateTime movementDate,
    required String movementDescription,
    required String movementResponsible,
  }) async {
    final draft = await _getDraft();

    if (!draft.containsKey('stepOne')) {
      throw Exception('Step 1 não foi salvo.');
    }

    draft['stepTwo'] = {
      "caseDates": {
        "lastMovementDate": lastMovementDate.toIso8601String(),
        "nextDeadline": nextDeadline.toIso8601String(),
        "deadlineDescription": deadlineDescription,
        "hearingDate": hearingDate?.toIso8601String(),
        "hearingType": hearingType?.isEmpty ?? true ? null : hearingType,
      },
      "movements": [
        {
          "movementDate": movementDate.toIso8601String(),
          "description": movementDescription,
          "responsible": movementResponsible,
        },
      ],
    };

    await _saveDraft(draft);
  }

  Future<void> saveStepThree({
    required String representativeName,
    required String barNumber,
    required String contact,
    required String documentType,
    required DateTime documentDate,
    required String notes,
    required String filePath,
  }) async {
    final draft = await _getDraft();

    if (!draft.containsKey('stepTwo')) {
      throw Exception('Step 2 não foi salvo.');
    }

    draft['stepThree'] = {
      "legalRepresentative": {
        "name": representativeName,
        "barNumber": barNumber,
        "contact": contact,
      },
      "documents": [
        {
          "documentType": documentType,
          "documentDate": documentDate.toIso8601String(),
          "notes": notes,
          "filePath": filePath,
        },
      ],
    };

    await _saveDraft(draft);
  }

  Future<void> addMovement({
    required DateTime movementDate,
    required String description,
    required String responsible,
  }) async {
    final draft = await _getDraft();

    final movements = List<Map<String, dynamic>>.from(
      draft['stepTwo']['movements'] ?? [],
    );

    movements.add({
      "movementDate": movementDate.toIso8601String(),
      "description": description,
      "responsible": responsible,
    });

    draft['stepTwo']['movements'] = movements;

    await _saveDraft(draft);
  }

  Future<void> saveAllToDatabase() async {
    final draft = await getDraft();

    if (draft.isEmpty) {
      throw Exception('Draft vazio');
    }

    await repository.saveFromDraft(draft);
    await clearDraft();
  }

  Future<Map<String, dynamic>> getDraft() => _getDraft();

  Future<void> clearDraft() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_draftKey);
  }

  Future<Map<String, dynamic>> _getDraft() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_draftKey);
    if (raw == null) return {};
    return jsonDecode(raw) as Map<String, dynamic>;
  }

  Future<void> _saveDraft(Map<String, dynamic> draft) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_draftKey, jsonEncode(draft));
  }
}
