import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'tables/case_documents_table.dart';
import 'tables/legal_case_table.dart';
import 'tables/main_parties_table.dart';
import 'tables/opposing_parties_table.dart';
import 'tables/legal_representative_table.dart';
import 'tables/case_dates_table.dart';
import 'tables/case_movements_table.dart';

part 'database.g.dart';

@DriftDatabase(
  tables: [
    LegalCases,
    MainParties,
    OpposingParties,
    LegalRepresentatives,
    CaseDates,
    CaseMovements,
    CaseDocuments,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File(p.join(dir.path, 'db.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
