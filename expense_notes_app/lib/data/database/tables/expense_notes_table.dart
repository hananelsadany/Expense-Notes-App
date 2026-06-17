import 'package:drift/drift.dart';

class ExpenseNotes extends Table {
  TextColumn get uuid => text().withLength(min: 1, max: 36)();
  TextColumn get title => text()();
  TextColumn get userId => text()();
  TextColumn get status => text()();
  TextColumn get syncStatus => text()();
  DateTimeColumn get creationDate => dateTime()();
  DateTimeColumn get updateDate => dateTime()();
  TextColumn get receiptPhotoPath => text().nullable()();
  RealColumn get latitude => real().nullable()();
  RealColumn get longitude => real().nullable()();
  RealColumn get locationAccuracy => real().nullable()();
  DateTimeColumn get locationTimestamp => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {uuid};
}
