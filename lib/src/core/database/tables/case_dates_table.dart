import 'package:drift/drift.dart';
import 'package:shadprocess/src/core/database/tables/legal_case_table.dart';

class CaseDates extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get legalCaseId =>
      integer().references(LegalCases, #id, onDelete: KeyAction.cascade)();

  DateTimeColumn get lastMovementDate => dateTime()();
  DateTimeColumn get nextDeadline => dateTime()();
  TextColumn get deadlineDescription => text()();

  DateTimeColumn get hearingDate => dateTime().nullable()();
  ColumnBuilder<String> get hearingType =>
      text().nullable(); // Conciliation, Judgment...
}
