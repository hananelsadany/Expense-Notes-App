import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/repo/expense_note_repository.dart';
import '../core/network/connectivity_service.dart';
import 'database_provider.dart';
import 'dio_provider.dart';
import '../data/remote/api_service.dart';

final connectivityServiceProvider = Provider<ConnectivityService>((ref) {
  return ConnectivityService();
});

final apiServiceProvider = Provider<ApiService>((ref) {
  final dio = ref.watch(dioProvider);
  return ApiService(dio);
});

final expenseNoteRepositoryProvider = Provider<IExpenseNoteRepository>((ref) {
  final db = ref.watch(databaseProvider);
  final api = ref.watch(apiServiceProvider);
  final connectivity = ref.watch(connectivityServiceProvider);
  return ExpenseNoteRepository(db, api, connectivity);
});
