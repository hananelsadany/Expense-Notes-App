import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'dart:io';

import 'tables/expense_lines.dart';
import 'tables/expense_notes_table.dart';
import 'tables/categories_table.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [ExpenseNotes, ExpenseLines, Categories])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());
  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'app_database.db'));
    return NativeDatabase(file);
  });
}
