import 'package:expense_notes_app/UI/screens/add_new_expense_note.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/expense_note_provider.dart';
import '../widgets/Note_card.dart';

class ExpenseNotesListScreen extends ConsumerStatefulWidget {
  const ExpenseNotesListScreen({super.key});

  @override
  ConsumerState<ExpenseNotesListScreen> createState() =>
      _ExpenseNotesListScreenState();
}

class _ExpenseNotesListScreenState
    extends ConsumerState<ExpenseNotesListScreen> {
  @override
  Widget build(BuildContext context) {
    final fstate = ref.watch(expenseNoteProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Notes'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () async {
              await ref.read(expenseNoteProvider.notifier).loadNotes();
            },
          ),
        ],
      ),
      body: RefreshIndicator(
        backgroundColor: Theme.of(context).colorScheme.surface,
        onRefresh: () async {
          await ref.read(expenseNoteProvider.notifier).loadNotes();
        },
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              SearchBar(hintText: 'Search notes...', onChanged: (value) => {}),
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
                Expanded(
                  child: ListView.builder(
                    itemCount: fstate.notes.length,
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final note = fstate.notes[index];
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
