import 'package:shadprocess/src/core/database/models/case_dates_model.dart';
import 'package:shadprocess/src/core/database/models/case_documents_model.dart';
import 'package:shadprocess/src/core/database/models/case_movement_model.dart';
import 'package:shadprocess/src/core/database/models/legal_representative_model.dart';
import 'package:shadprocess/src/core/database/models/main_party_model.dart';

class LegalCase {
  final String caseNumber;
  final String
  caseType; // Judicial, Administrative, Labor, Civil, Criminal, Other
  final String area;
  final String court;
  final String jurisdiction;
  final String
  status; // In Progress, Pending Decision, Archived, Closed, Suspended
  final String priority; // Low, Medium, High
  final DateTime startDate;
  final DateTime? expectedEndDate;

  final MainParty mainParty;
  final OpposingParty opposingParty;
  final LegalRepresentative legalRepresentative;

  final CaseDates caseDates;
  final List<CaseDocument> documents;
  final List<CaseMovement> movements;

  LegalCase({
    required this.caseNumber,
    required this.caseType,
    required this.area,
    required this.court,
    required this.jurisdiction,
    required this.status,
    required this.priority,
    required this.startDate,
    this.expectedEndDate,
    required this.mainParty,
    required this.opposingParty,
    required this.legalRepresentative,
    required this.caseDates,
    required this.documents,
    required this.movements,
  });
}
