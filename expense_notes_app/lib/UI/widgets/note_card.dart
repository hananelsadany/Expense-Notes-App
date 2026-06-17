import 'package:flutter/material.dart';
import '../../data/model/expense_note_model.dart';
import 'package:intl/intl.dart';
import 'package:expense_notes_app/UI/widgets/sync_chip.dart';
import 'package:expense_notes_app/UI/widgets/status_chip.dart';

class NoteCard extends StatelessWidget {
  final ExpenseNoteModel note;
  const NoteCard({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final dateFormat = DateFormat('MMM dd, yyyy');

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          Navigator.pushNamed(context, '/detail', arguments: note);
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── Row 1: Title + Status chip ────────────
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      note.title,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(width: 8),
                  StatusChip(status: note.status),
                ],
              ),

              const SizedBox(height: 8),

              // ── Row 2: UUID ───────────────────────────
              Text(
                'ID: ${note.uuid}',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: Colors.grey,
                  fontFamily: 'monospace',
                ),
                overflow: TextOverflow.ellipsis,
              ),

              const SizedBox(height: 4),

              // ── Row 3: User ───────────────────────────
              Row(
                children: [
                  const Icon(
                    Icons.person_outline,
                    size: 14,
                    color: Colors.grey,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    note.userId,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: Colors.grey.shade700,
                    ),
                  ),
                ],
              ),

              const Divider(height: 20),

              // ── Row 4: Lines count + Total amount ─────
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.receipt_long,
                        size: 16,
                        color: Colors.blueGrey,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '${note.lines.length} line${note.lines.length == 1 ? '' : 's'}',
                        style: theme.textTheme.bodyMedium,
                      ),
                    ],
                  ),
                  Text(
                    '\$${note.totalAmount.toStringAsFixed(2)}',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.primary,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 8),

              // ── Row 5: Creation date + Sync status ────
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.calendar_today,
                        size: 14,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        dateFormat.format(note.creationDate),
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                  SyncChip(syncStatus: note.syncStatus),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
