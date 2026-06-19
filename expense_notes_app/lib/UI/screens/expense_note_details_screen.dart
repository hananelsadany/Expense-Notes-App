import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:expense_notes_app/data/model/expense_note_model.dart';
import '../widgets/detailsScreen/header_card.dart';
import '../widgets/detailsScreen/expense_lines_section.dart';
import '../widgets/detailsScreen/receipts_section.dart';
import '../widgets/detailsScreen/location_section.dart';
import '../widgets/detailsScreen/status_action.dart';

class ExpenseNoteDetailsScreen extends ConsumerWidget {
  ExpenseNoteDetailsScreen({super.key, required this.note});

  final ExpenseNoteModel note;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Expense Note Details')),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderCard(
              UUID: note.uuid,
              title: note.title,
              status: note.syncStatus,
            ),

            // Expense lines
            ...note.lines.map(
              (line) => Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 4,
                ),
                child: ExpenseLinesSection(
                  description: line.description,
                  category: line.categoryUuid ?? 'Uncategorized',
                  quantity: line.quantity,
                  unitPrice: line.unitPrice,
                  lineTotal: line.lineTotal,
                ),
              ),
            ),
            // Only for local notes
            if (note.syncStatus == 'unsynced') ...[
              ReceiptsSection(
                receiptPaths: (note.receiptPhotoPath?.isNotEmpty ?? false)
                    ? note.receiptPhotoPath!.split('|')
                    : [],
              ),
              //ReceiptsSection(receiptPaths: [note.receiptPhotoPath ?? ""]),
              LocationSection(
                latitude: note.latitude ?? 0.0,
                longitude: note.longitude ?? 0.0,
                accuracy: note.locationAccuracy ?? 0.0,
                acquisitionTimestamp: note.locationTimestamp ?? DateTime.now(),
              ),
            ],

            StatusActions(
              currentStatus: note.status,
              onStatusChange: (newStatus) {
                // call your riverpod notifier here
              },
            ),
          ],
        ),
      ),
    );
  }
}
