import 'package:expense_notes_app/data/model/expense_line_model.dart';
import 'package:expense_notes_app/data/model/expense_note_model.dart';

abstract class IExpenseNoteRepository {
  Future<List<ExpenseNoteModel>> getAllNotes();
  Future<ExpenseNoteModel?> getNoteByUuid(String uuid);
  Future<void> insertNote(ExpenseNoteModel note);
  Future<void> updateNote(ExpenseNoteModel note);
  Future<void> deleteNote(String uuid);
  Future<List<ExpenseLineModel>> getLinesForNote(String noteUuid);
  Future<void> insertLine(ExpenseLineModel line);
  Future<void> deleteLine(String lineUuid);
}

class ExpenseNoteRepository implements IExpenseNoteRepository {
  
  @override
  Future<List<ExpenseNoteModel>> getAllNotes() {
    return Future.value([]);
  }
  
  @override
  Future<void> deleteLine(String lineUuid) {
    // TODO: implement deleteLine
    throw UnimplementedError();
  }
  
  @override
  Future<void> deleteNote(String uuid) {
    // TODO: implement deleteNote
    throw UnimplementedError();
  }
  
  @override
  Future<List<ExpenseLineModel>> getLinesForNote(String noteUuid) {
    // TODO: implement getLinesForNote
    throw UnimplementedError();
  }
  
  @override
  Future<ExpenseNoteModel?> getNoteByUuid(String uuid) {
    // TODO: implement getNoteByUuid
    throw UnimplementedError();
  }
  
  @override
  Future<void> insertLine(ExpenseLineModel line) {
    // TODO: implement insertLine
    throw UnimplementedError();
  }
  
  @override
  Future<void> insertNote(ExpenseNoteModel note) {
    // TODO: implement insertNote
    throw UnimplementedError();
  }
  
  @override
  Future<void> updateNote(ExpenseNoteModel note) {
    // TODO: implement updateNote
    throw UnimplementedError();
  }
}
