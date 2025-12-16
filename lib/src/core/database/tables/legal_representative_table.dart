import 'package:drift/drift.dart';
import 'package:shadprocess/src/core/database/tables/legal_case_table.dart';

class LegalRepresentatives extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get legalCaseId =>
      integer().references(LegalCases, #id, onDelete: KeyAction.cascade)();

  TextColumn get name => text()();
  TextColumn get barNumber => text()(); // OAB
  TextColumn get contact => text()();
}
