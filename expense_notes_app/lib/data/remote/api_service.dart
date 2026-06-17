// lib/data/remote/api_service.dart

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/expense_note_model.dart';
import '../model/expense_line_model.dart';
import '../../providers/dio_provider.dart';

final apiServiceProvider = Provider<ApiService>((ref) {
  final dio = ref.watch(dioProvider);
  return ApiService(dio);
});

class ApiService {
  final Dio _dio;

  ApiService(this._dio);

  Future<List<ExpenseNoteModel>> fetchNotes() async {
    final response = await _dio.get('/api/expense-notes');
    print('API response for fetchNotes: ${response.data}');
    return (response.data as List)
        .map((json) => ExpenseNoteModel.fromJson(json))
        .toList();
  }

  Future<ExpenseNoteModel> fetchNoteByUuid(String uuid) async {
    final response = await _dio.get('/api/expense-notes/$uuid');
    return ExpenseNoteModel.fromJson(response.data);
  }

  Future<ExpenseNoteModel> createNote(ExpenseNoteModel note) async {
    final response = await _dio.post('/api/expense-notes', data: note.toJson());
    return ExpenseNoteModel.fromJson(response.data);
  }

  Future<ExpenseNoteModel> updateNote(ExpenseNoteModel note) async {
    final response = await _dio.put(
      '/api/expense-notes/${note.uuid}',
      data: note.toJson(),
    );
    return ExpenseNoteModel.fromJson(response.data);
  }

  Future<void> patchNoteStatus(String uuid, String status) async {
    await _dio.patch(
      '/api/expense-notes/$uuid',
      data: {'status': status, 'update_date': DateTime.now().toIso8601String()},
    );
  }

  Future<List<ExpenseLineModel>> getLinesForNote(String noteUuid) async {
    final response = await _dio.get('/api/expense-notes/$noteUuid/lines');
    return (response.data as List)
        .map((json) => ExpenseLineModel.fromJson(json))
        .toList();
  }

  Future<ExpenseNoteModel> getNoteByUuid(String uuid) async {
    final response = await _dio.get('/api/expense-notes/$uuid');
    return ExpenseNoteModel.fromJson(response.data);
  }

  Future<ExpenseLineModel> insertLine(ExpenseLineModel line) async {
    final response = await _dio.post('/api/expense-lines', data: line.toJson());
    return ExpenseLineModel.fromJson(response.data);
  }

  Future<ExpenseNoteModel> insertNote(ExpenseNoteModel note) async {
    final response = await _dio.post('/api/expense-notes', data: note.toJson());
    return ExpenseNoteModel.fromJson(response.data);
  }

  Future<void> deleteNote(String uuid) async {
    await _dio.delete('/api/expense-notes/$uuid');
  }

  Future<void> deleteLine(String lineUuid) async {
    await _dio.delete('/api/expense-lines/$lineUuid');
  }
}
