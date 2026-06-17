import 'package:drift/drift.dart';

class Categories extends Table {
  TextColumn get uuid => text().withLength(min: 1, max: 36)();
  TextColumn get name => text()();

  @override
  Set<Column> get primaryKey => {uuid};
}
