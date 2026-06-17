import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:expense_notes_app/data/model/expense_line_model.dart';
import '../widgets/detailsScreen/expense_lines_section.dart';
import '../widgets/image_input.dart';
import 'package:uuid/uuid.dart';
import 'dart:math';
import 'package:image_picker/image_picker.dart';

class AddNewExpenseNoteScreen extends ConsumerStatefulWidget {
  const AddNewExpenseNoteScreen({super.key});

  @override
  ConsumerState<AddNewExpenseNoteScreen> createState() =>
      _AddNewExpenseNoteScreenState();
}

class _AddNewExpenseNoteScreenState
    extends ConsumerState<AddNewExpenseNoteScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final List<ExpenseLineModel> _lines = [];

  final List<String> _photoPaths = [];
  final _picker = ImagePicker();
  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add New Expense Note')),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── Title ──────────────────────────────
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(
                  labelText: 'Note Title *',
                  border: OutlineInputBorder(),
                ),
                validator: (v) {
                  if (v == null || v.trim().isEmpty) {
                    return 'Title is required';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 24),

              // ── Expense Lines Section ───────────────
              const Text('Expense Lines'),
              const SizedBox(height: 8),

              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _lines.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ExpenseLinesSection(
                      key: ValueKey(_lines[index].uuid),
                      description: _lines[index].description,
                      category: _lines[index].categoryUuid ?? 'Unknown',
                      quantity: _lines[index].quantity,
                      unitPrice: _lines[index].unitPrice,
                      lineTotal: _lines[index].lineTotal,
                    ),
                  );
                },
              ),

              const SizedBox(height: 8),

              TextButton.icon(
                onPressed: () {
                  setState(() {
                    _lines.add(
                      ExpenseLineModel(
                        uuid: const Uuid().v4(),
                        noteUuid: const Uuid().v4(),
                        categoryUuid: 'cat-001',
                        description: 'dummy description',
                        quantity: Random().nextInt(10) + 1,
                        unitPrice: Random().nextDouble() * 100,
                      ),
                    );
                  });
                },
                icon: const Icon(Icons.add),
                label: const Text('Add Line'),
              ),
              const SizedBox(height: 8),

              // Note total
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'Note Total: \$${_lines.fold(0.0, (sum, l) => sum + l.lineTotal).toStringAsFixed(2)}',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              // lines list goes here
              const SizedBox(height: 24),

              // ── Photos Section ──────────────────────
              const Text('Receipt Photos'),
              const SizedBox(height: 8),
              ImageInput(
                onImagesChanged: (images) {
                  _photoPaths
                    ..clear()
                    ..addAll(images.map((f) => f.path));
                },
              ),
              const SizedBox(height: 8),

              // photos strip goes here
              const SizedBox(height: 24),

              // ── Location Section ────────────────────
              const Text('Location'),
              const SizedBox(height: 8),

              // location button goes here
              const SizedBox(height: 32),

              // ── Submit Button ───────────────────────
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Handle form submission
                  }
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
