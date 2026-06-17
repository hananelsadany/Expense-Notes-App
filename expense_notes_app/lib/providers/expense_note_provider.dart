import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/model/expense_note_model.dart';
import '../data/model/expense_line_model.dart';
import '../data/repo/expense_note_repository.dart';
import '../core/errors/failures.dart';
import 'repository_provider.dart';

class ExpenseNoteState {
  final List<ExpenseNoteModel> notes;
  final bool isLoading;
  final Failure? failure;

  const ExpenseNoteState({
    this.notes = const [],
    this.isLoading = false,
    this.failure,
  });

  ExpenseNoteState copyWith({
    List<ExpenseNoteModel>? notes,
    bool? isLoading,
    Failure? failure,
    bool clearFailure = false, // explicit flag to null out failure
  }) {
    return ExpenseNoteState(
      notes: notes ?? this.notes,
      isLoading: isLoading ?? this.isLoading,
      failure: clearFailure ? null : (failure ?? this.failure),
    );
  }
}

// Notifier

class ExpenseNoteNotifier extends StateNotifier<ExpenseNoteState> {
  final IExpenseNoteRepository _repository;

  // Constructor receives the repository and passes initial state to super
  ExpenseNoteNotifier(this._repository) : super(const ExpenseNoteState());

  // Load all notes
  Future<void> loadNotes() async {
    state = state.copyWith(isLoading: true, clearFailure: true);
    try {
      final notes = await _repository.getAllNotes();
      state = state.copyWith(notes: notes, isLoading: false);
    } on Failure catch (f) {
      state = state.copyWith(isLoading: false, failure: f);
    }
  }

  // Insert note
  Future<void> insertNote(ExpenseNoteModel note) async {
    state = state.copyWith(isLoading: true, clearFailure: true);
    try {
      await _repository.insertNote(note);
      await loadNotes();
    } on Failure catch (f) {
      state = state.copyWith(isLoading: false, failure: f);
    }
  }

  // Update note
  Future<void> updateNote(ExpenseNoteModel note) async {
    state = state.copyWith(isLoading: true, clearFailure: true);
    try {
      await _repository.updateNote(note);
      await loadNotes();
    } on Failure catch (f) {
      state = state.copyWith(isLoading: false, failure: f);
    }
  }

  // Delete note
  Future<void> deleteNote(String uuid) async {
    state = state.copyWith(isLoading: true, clearFailure: true);
    try {
      await _repository.deleteNote(uuid);
      await loadNotes();
    } on Failure catch (f) {
      state = state.copyWith(isLoading: false, failure: f);
    }
  }

  // Insert line
  Future<void> insertLine(ExpenseLineModel line) async {
    state = state.copyWith(isLoading: true, clearFailure: true);
    try {
      await _repository.insertLine(line);
      await loadNotes();
    } on Failure catch (f) {
      state = state.copyWith(isLoading: false, failure: f);
    }
  }

  // Delete line
  Future<void> deleteLine(String lineUuid) async {
    state = state.copyWith(isLoading: true, clearFailure: true);
    try {
      await _repository.deleteLine(lineUuid);
      await loadNotes();
    } on Failure catch (f) {
      state = state.copyWith(isLoading: false, failure: f);
    }
  }

  // Clear failure manually (e.g. when dismissing a banner)
  void clearFailure() {
    state = state.copyWith(clearFailure: true);
  }
}

// Provider

final expenseNoteProvider =
    StateNotifierProvider<ExpenseNoteNotifier, ExpenseNoteState>((ref) {
      final repository = ref.watch(expenseNoteRepositoryProvider);
      return ExpenseNoteNotifier(repository);
    });
