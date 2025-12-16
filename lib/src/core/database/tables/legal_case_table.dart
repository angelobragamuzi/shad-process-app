import 'package:drift/drift.dart';

class LegalCases extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get caseNumber => text()();
  TextColumn get caseType => text()(); // Civil, Criminal, Labor...
  TextColumn get area => text()();
  TextColumn get court => text()();
  TextColumn get jurisdiction => text()();

  TextColumn get status => text()(); // In Progress, Closed...
  TextColumn get priority => text()(); // Low, Medium, High

  DateTimeColumn get startDate => dateTime()();
  DateTimeColumn get expectedEndDate => dateTime().nullable()();

  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}
