import 'package:flutter/material.dart';
import '../../data/model/expense_note_model.dart';
import 'package:expense_notes_app/UI/widgets/note_card.dart';

class NotesList extends StatelessWidget {
  final List<ExpenseNoteModel> notes;
  const NotesList({required this.notes});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 80),
      itemCount: notes.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        return NoteCard(note: notes[index]);
      },
    );
  }
}
