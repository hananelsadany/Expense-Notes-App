import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'dart:io';

import 'tables/expense_lines_table.dart';
import 'tables/expense_notes_table.dart';
import 'tables/categories_table.dart';
import '../model/expense_note_model.dart';
import '../model/expense_line_model.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [ExpenseNotes, ExpenseLines, Categories])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  //Notes

  Future<List<ExpenseNote>> getAllNotes() => select(expenseNotes).get();

  Future<ExpenseNote?> getNoteByUuid(String uuid) => (select(
    expenseNotes,
  )..where((t) => t.uuid.equals(uuid))).getSingleOrNull();

  Future<void> saveNote(ExpenseNoteModel note) =>
      into(expenseNotes).insertOnConflictUpdate(note.toCompanion());

  Future<void> deleteNote(String uuid) =>
      (delete(expenseNotes)..where((t) => t.uuid.equals(uuid))).go();

  Future<void> clearNotes() => delete(expenseNotes).go();

  //Lines

  Future<List<ExpenseLine>> getLinesForNote(String noteUuid) =>
      (select(expenseLines)..where((t) => t.noteUuid.equals(noteUuid))).get();

  Future<void> saveLine(ExpenseLineModel line) =>
      into(expenseLines).insertOnConflictUpdate(line.toCompanion());

  Future<void> saveLines(List<ExpenseLineModel> lines) async {
    for (final line in lines) {
      await saveLine(line);
    }
  }

  Future<void> deleteLine(String uuid) =>
      (delete(expenseLines)..where((t) => t.uuid.equals(uuid))).go();

  Future<void> clearLines() => delete(expenseLines).go();
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'app_database.db'));
    return NativeDatabase(file);
  });
}
