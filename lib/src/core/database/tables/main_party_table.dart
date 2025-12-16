import 'package:drift/drift.dart';
import 'package:shadprocess/src/core/database/tables/legal_case_table.dart';

class MainParties extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get legalCaseId =>
      integer().references(LegalCases, #id, onDelete: KeyAction.cascade)();

  TextColumn get name => text()();
  TextColumn get role => text()(); // Plaintiff, Defendant...
  TextColumn get taxId => text().nullable()();
}
