import 'package:expense_notes_app/data/model/expense_line_model.dart';
import 'package:expense_notes_app/data/model/expense_note_model.dart';
import '../database/app_database.dart';
import '../../core/network/connectivity_service.dart';
import '../remote/api_service.dart';
import '../../core/errors/error_mapper.dart';
import 'package:dio/dio.dart';

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
  final AppDatabase _db;
  final ApiService _api;
  final ConnectivityService _connectivity;

  ExpenseNoteRepository(this._db, this._api, this._connectivity);

  @override
  Future<List<ExpenseNoteModel>> getAllNotes() async {
    final failure = await _connectivity.hasConnection();
    final hasConnection = failure == null;
    print('Checking connectivity... hasConnection: $hasConnection');
    if (hasConnection == false) {
      try {
        final notes = await _db.getAllNotes();
        print('Notes retrieved from local database: $notes');
        return Future.wait(
          notes.map((row) async {
            final lineRows = await _db.getLinesForNote(row.uuid);
            final lines = lineRows.map(_toLineModel).toList();
            return _toNoteModel(row, lines);
          }),
        );
      } catch (e) {
        throw ErrorMapper.fromDbError(e);
      }
    }
    // Online — fetch from API, save to DB, return from DB
    try {
      // Step 1
      final remoteNotes = await _api.fetchNotes();
      print('Notes retrieved from API: $remoteNotes');
      // Step 2
      for (final note in remoteNotes) {
        await _db.saveNote(note);
        for (final line in note.lines) {
          await _db.saveLine(line);
        }
      }
      // Step 3
      final noteRows = await _db.getAllNotes();
      return Future.wait(
        noteRows.map((row) async {
          final lineRows = await _db.getLinesForNote(row.uuid);
          final lines = lineRows.map(_toLineModel).toList();
          return _toNoteModel(row, lines);
        }),
      );
      /* final notes = await _db.getAllNotes();
      print('Notes retrieved from local database after sync: $notes');
      return notes
          .map((note) => ExpenseNoteModel.fromJson(note.toJson()))
          .toList();*/
    } on DioException catch (e) {
      throw ErrorMapper.fromDioError(e);
    } catch (e) {
      throw ErrorMapper.fromDbError(e);
    }
  }

  @override
  Future<void> deleteLine(String lineUuid) async {
    final hasConnection = await _connectivity.hasConnection() ?? false;

    if (hasConnection == false) {
      try {
        await _db.deleteLine(lineUuid);
      } catch (e) {
        throw ErrorMapper.fromDbError(e);
      }
    } else {
      try {
        await _api.deleteLine(lineUuid);
        await _db.deleteLine(lineUuid);
      } on DioException catch (e) {
        throw ErrorMapper.fromDioError(e);
      } catch (e) {
        throw ErrorMapper.fromDbError(e);
      }
    }
  }

  @override
  Future<void> deleteNote(String uuid) async {
    final hasConnection = await _connectivity.hasConnection() ?? false;

    if (hasConnection == false) {
      try {
        await _db.deleteNote(uuid);
      } catch (e) {
        throw ErrorMapper.fromDbError(e);
      }
    } else {
      try {
        await _api.deleteNote(uuid);
        await _db.deleteNote(uuid);
      } on DioException catch (e) {
        throw ErrorMapper.fromDioError(e);
      } catch (e) {
        throw ErrorMapper.fromDbError(e);
      }
    }
  }

  @override
  Future<List<ExpenseLineModel>> getLinesForNote(String noteUuid) async {
    final hasConnection = await _connectivity.hasConnection() ?? false;

    if (hasConnection == false) {
      try {
        final lines = await _db.getLinesForNote(noteUuid);
        return lines
            .map((line) => ExpenseLineModel.fromJson(line.toJson()))
            .toList();
      } catch (e) {
        throw ErrorMapper.fromDbError(e);
      }
    } else {
      try {
        final lines = await _api.getLinesForNote(noteUuid);
        await _db.saveLines(lines);
        return lines;
      } on DioException catch (e) {
        throw ErrorMapper.fromDioError(e);
      } catch (e) {
        throw ErrorMapper.fromDbError(e);
      }
    }
  }

  @override
  Future<ExpenseNoteModel?> getNoteByUuid(String uuid) async {
    final hasConnection = await _connectivity.hasConnection() ?? false;

    if (hasConnection == false) {
      try {
        final note = await _db.getNoteByUuid(uuid);
        return note != null ? ExpenseNoteModel.fromJson(note.toJson()) : null;
      } catch (e) {
        throw ErrorMapper.fromDbError(e);
      }
    } else {
      try {
        final note = await _api.getNoteByUuid(uuid);
        if (note != null) {
          await _db.saveNote(note);
        }
        return note;
      } on DioException catch (e) {
        throw ErrorMapper.fromDioError(e);
      } catch (e) {
        throw ErrorMapper.fromDbError(e);
      }
    }
  }

  @override
  Future<void> insertLine(ExpenseLineModel line) async {
    final hasConnection = await _connectivity.hasConnection() ?? false;

    if (hasConnection == false) {
      try {
        await _db.saveLine(line);
      } catch (e) {
        throw ErrorMapper.fromDbError(e);
      }
    } else {
      try {
        await _api.insertLine(line);
        await _db.saveLine(line);
      } on DioException catch (e) {
        throw ErrorMapper.fromDioError(e);
      } catch (e) {
        throw ErrorMapper.fromDbError(e);
      }
    }
  }

  @override
  Future<void> insertNote(ExpenseNoteModel note) async {
    final hasConnection = await _connectivity.hasConnection() ?? false;

    if (hasConnection == false) {
      try {
        await _db.saveNote(note);
      } catch (e) {
        throw ErrorMapper.fromDbError(e);
      }
    } else {
      try {
        await _api.insertNote(note);
        await _db.saveNote(note);
      } on DioException catch (e) {
        throw ErrorMapper.fromDioError(e);
      } catch (e) {
        throw ErrorMapper.fromDbError(e);
      }
    }
  }

  @override
  Future<void> updateNote(ExpenseNoteModel note) async {
    final hasConnection = await _connectivity.hasConnection() ?? false;

    if (hasConnection == false) {
      try {
        await _db.saveNote(note);
      } catch (e) {
        throw ErrorMapper.fromDbError(e);
      }
    } else {
      try {
        await _api.updateNote(note);
        await _db.saveNote(note);
      } on DioException catch (e) {
        throw ErrorMapper.fromDioError(e);
      } catch (e) {
        throw ErrorMapper.fromDbError(e);
      }
    }
  }

  ExpenseNoteModel _toNoteModel(ExpenseNote row, List<ExpenseLineModel> lines) {
    final total = lines.fold(0.0, (sum, l) => sum + l.lineTotal);
    return ExpenseNoteModel(
      uuid: row.uuid,
      title: row.title,
      userId: row.userId,
      status: row.status,
      syncStatus: row.syncStatus,
      creationDate: row.creationDate,
      updateDate: row.updateDate,
      receiptPhotoPath: row.receiptPhotoPath,
      latitude: row.latitude,
      longitude: row.longitude,
      locationAccuracy: row.locationAccuracy,
      locationTimestamp: row.locationTimestamp,
      totalAmount: total,
      lines: lines,
    );
  }

  ExpenseLineModel _toLineModel(ExpenseLine row) {
    return ExpenseLineModel(
      uuid: row.uuid,
      noteUuid: row.noteUuid,
      description: row.description,
      categoryUuid: row.categoryUuid,
      quantity: row.quantity,
      unitPrice: row.unitPrice,
    );
  }
}
