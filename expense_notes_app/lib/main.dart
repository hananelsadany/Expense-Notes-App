import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//import 'UI/screens/expense_notes_list_screen.dart';
import 'UI/screens/expensenotes_list_Screen.dart';
import 'UI/screens/expense_note_details_screen.dart';
import 'data/model/expense_note_model.dart';
import 'UI/screens/add_new_expense_note.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Notes',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: const Color.fromARGB(255, 177, 63, 181),
        useMaterial3: true,
      ),
      home: const ExpenseNotesListScreen(),
      routes: {
        '/detail': (context) => ExpenseNoteDetailsScreen(
          note: ModalRoute.of(context)!.settings.arguments as ExpenseNoteModel,
        ),
        '/add': (context) => const AddNewExpenseNoteScreen(),
      },
    );
  }
}
