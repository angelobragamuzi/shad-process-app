import 'package:drift/drift.dart';
import 'legal_case_table.dart';

class CaseDates extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get legalCaseId =>
      integer().references(LegalCases, #id, onDelete: KeyAction.cascade)();

  DateTimeColumn get lastMovementDate => dateTime()();
  DateTimeColumn get nextDeadline => dateTime()();
  TextColumn get deadlineDescription => text()();

  DateTimeColumn get hearingDate => dateTime().nullable()();
  TextColumn get hearingType => text().nullable()();
}
