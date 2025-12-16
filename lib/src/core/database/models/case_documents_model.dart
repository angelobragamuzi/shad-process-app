class CaseDocument {
  final String
  documentType; // Initial Petition, Defense, Appeal, Decision, Sentence, Other
  final DateTime documentDate;
  final String notes;
  final String filePath;

  CaseDocument({
    required this.documentType,
    required this.documentDate,
    required this.notes,
    required this.filePath,
  });
}
