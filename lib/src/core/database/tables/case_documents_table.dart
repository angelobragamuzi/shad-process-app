import 'package:drift/drift.dart';
import 'package:shadprocess/src/core/database/tables/legal_case_table.dart';

class CaseDocuments extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get legalCaseId =>
      integer().references(LegalCases, #id, onDelete: KeyAction.cascade)();

  TextColumn get documentType => text()(); // Petition, Appeal...
  DateTimeColumn get documentDate => dateTime()();

  TextColumn get notes => text().nullable()();
  TextColumn get filePath => text()();
}
