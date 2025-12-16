import 'package:drift/drift.dart';
import 'package:shadprocess/src/core/database/models/case_dates_model.dart';
import 'package:shadprocess/src/core/database/tables/case_documents_table.dart';
import 'package:shadprocess/src/core/database/tables/case_movements_table.dart';
import 'package:shadprocess/src/core/database/tables/legal_case_table.dart';
import 'package:shadprocess/src/core/database/tables/legal_representative_table.dart';
import 'package:shadprocess/src/core/database/tables/main_party_table.dart';
import 'package:shadprocess/src/core/database/tables/opposing_parties_table.dart';
part 'app_database.g.dart';

@DriftDatabase(
  tables: [
    LegalCases,
    MainParties,
    OpposingParties,
    LegalRepresentatives,
    CaseDates,
    CaseDocuments,
    CaseMovements,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}
