class CaseDates {
  final DateTime lastMovementDate;
  final DateTime nextDeadline;
  final String deadlineDescription;
  final DateTime? hearingDate;
  final String? hearingType; // Conciliation, Instruction, Judgment

  CaseDates({
    required this.lastMovementDate,
    required this.nextDeadline,
    required this.deadlineDescription,
    this.hearingDate,
    this.hearingType,
  });
}
