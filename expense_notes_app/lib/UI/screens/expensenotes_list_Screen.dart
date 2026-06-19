import 'package:expense_notes_app/UI/screens/add_new_expense_note.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/expense_note_provider.dart';
import '../widgets/Note_card.dart';
import '../widgets/filter/filter_bar.dart';
import '../../data/model/expense_note_model.dart';

class ExpenseNotesListScreen extends ConsumerStatefulWidget {
  const ExpenseNotesListScreen({super.key});

  @override
  ConsumerState<ExpenseNotesListScreen> createState() =>
      _ExpenseNotesListScreenState();
}

class _ExpenseNotesListScreenState
    extends ConsumerState<ExpenseNotesListScreen> {
  // Filter state
  String _selectedStatus = 'all';
  String _selectedSync = 'all';

  // Computed
  List<ExpenseNoteModel> _filteredNotes(List<ExpenseNoteModel> notes) {
    return notes.where((note) {
      if (_selectedStatus != 'all' && note.status != _selectedStatus)
        return false;
      if (_selectedSync == 'synced' && note.syncStatus != 'synced')
        return false;
      if (_selectedSync == 'unsynced' && note.syncStatus != 'unsynced')
        return false;
      return true;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final fstate = ref.watch(expenseNoteProvider);
    final filtered = _filteredNotes(fstate.notes);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Notes'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _refreshWithFeedback,
            /*() async {
              await ref.read(expenseNoteProvider.notifier).loadNotes();
            },*/
          ),
        ],
      ),
      body: RefreshIndicator(
        backgroundColor: Theme.of(context).colorScheme.surface,
        onRefresh: _refreshWithFeedback,
        /*() async {
          await ref.read(expenseNoteProvider.notifier).loadNotes();
        },*/
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              //  SearchBar(hintText: 'Search notes...', onChanged: (value) => {}),
              if (fstate.isLoading)
                SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Expanded(
                    child: const Center(child: CircularProgressIndicator()),
                  ),
                )
              else if (fstate.failure != null)
                SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Expanded(
                    child: Column(
                      children: [
                        const SizedBox(height: 80),
                        Icon(
                          Icons.error_outline_outlined,
                          size: 80,
                          color: Colors.grey,
                        ),
                        const SizedBox(height: 16),
                        const Center(child: Text('Error loading notes')),
                      ],
                    ),
                  ),
                )
              else if (fstate.notes.isEmpty)
                SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Expanded(
                    child: Column(
                      children: [
                        const SizedBox(height: 80),
                        Icon(
                          Icons.note_alt_outlined,
                          size: 80,
                          color: Colors.grey,
                        ),
                        const SizedBox(height: 16),
                        const Center(child: Text('No notes found')),
                      ],
                    ),
                  ),
                )
              else
                FilterBar(
                  selectedStatus: _selectedStatus,
                  selectedSync: _selectedSync,
                  onStatusChanged: (val) =>
                      setState(() => _selectedStatus = val),
                  onSyncChanged: (val) => setState(() => _selectedSync = val),
                ),
              Expanded(
                child: ListView.builder(
                  itemCount: filtered.length,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final note = filtered[index];
                    return NoteCard(note: note);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showBottomSheet(context, 'Add a new expense note'),
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> _refreshWithFeedback() async {
    print('_refreshWithFeedback was called ... ');
    final notifier = ref.read(expenseNoteProvider.notifier);

    await notifier.loadNotes();

    final state = ref.read(expenseNoteProvider);
    print(state.failure);
    // only show warning if sync failed but we still have cached data
    if (state.failure != null && state.notes.isNotEmpty && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Sync failed, showing cached data'),
          behavior: SnackBarBehavior.floating,
          duration: Duration(seconds: 3),
        ),
      );
    }
  }
}

void _showBottomSheet(BuildContext context, String message) async {
  final result = await showModalBottomSheet(
    context: context,
    //isScrollControlled: true,
    clipBehavior: Clip.antiAliasWithSaveLayer,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(26)),
    ),
    builder: (context) => const AddNewExpenseNoteScreen(),
  );
  if (result != null) {
    // handle returned data
  }
}
