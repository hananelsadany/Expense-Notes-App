import 'package:drift/drift.dart';

class ExpenseLines extends Table {
  TextColumn get uuid => text().withLength(min: 1, max: 36)();
  TextColumn get noteUuid => text().withLength(min: 1, max: 36)();
  TextColumn get description => text()();
  TextColumn get categoryUuid =>
      text().withLength(min: 1, max: 36).nullable()();
  RealColumn get quantity => real()();
  RealColumn get unitPrice => real()();
  // RealColumn get lineTotal => real()(); quantity * unitPrice

  @override
  Set<Column> get primaryKey => {uuid};
}
