import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:expense_notes_app/data/model/expense_line_model.dart';
import '../widgets/detailsScreen/expense_lines_section.dart';
import '../widgets/image_input.dart';
import 'package:uuid/uuid.dart';
import 'dart:math';
import 'package:image_picker/image_picker.dart';
import '../widgets/location_input.dart';
import '../../data/model/expense_note_model.dart';
import '../../providers/expense_note_provider.dart';
import '../../data/user_data.dart';

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

  double? _latitude;
  double? _longitude;
  double? _locationAccuracy;
  DateTime? _locationTimestamp;

  bool _isSubmitting = false;
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

              // Photos Section
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

              // ── Location Section ────────────────────
              const Text('Location'),
              const SizedBox(height: 8),
              LocationInput(
                onLocationChanged: (lat, lng, accuracy, timestamp) {
                  _latitude = lat;
                  _longitude = lng;
                  _locationAccuracy = accuracy;
                  _locationTimestamp = timestamp;
                },
              ),
              // location button goes here
              const SizedBox(height: 32),

              // ── Submit Button ───────────────────────
              ElevatedButton(onPressed: _submit, child: const Text('Submit')),
            ],
          ),
        ),
      ),
    );
  }

  void _showSnack(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  bool _validateExtra() {
    if (_lines.isEmpty) {
      _showSnack('Add at least one expense line.');
      return false;
    }
    if (_photoPaths.isEmpty) {
      _showSnack('Attach at least one receipt photo.');
      return false;
    }
    if (_latitude == null || _longitude == null) {
      _showSnack('Please acquire your location before submitting.');
      return false;
    }
    return true;
  }

  Future<void> _submit() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    if (!_validateExtra()) return;

    setState(() => _isSubmitting = true);

    try {
      final noteUuid = const Uuid().v4();
      final now = DateTime.now();

      final lines = _lines.map((l) => l.copyWith(noteUuid: noteUuid)).toList();

      final note = ExpenseNoteModel(
        uuid: noteUuid,
        title: _titleController.text.trim(),
        userId: kDummyUserId,
        status: 'draft',
        syncStatus: 'unsynced',
        creationDate: now,
        updateDate: now,
        receiptPhotoPath: _photoPaths.join('|'),
        latitude: _latitude,
        longitude: _longitude,
        locationAccuracy: _locationAccuracy,
        locationTimestamp: _locationTimestamp,
        totalAmount: _lines.fold(0.0, (sum, l) => sum + l.lineTotal),
        lines: lines,
      );

      // notifier → repository → Drift + API (if online)
      await ref.read(expenseNoteProvider.notifier).insertNote(note);

      for (final line in lines) {
        await ref.read(expenseNoteProvider.notifier).insertLine(line);
      }

      if (mounted) {
        _showSnack('Expense note added successfully!');
        await Future.delayed(const Duration(seconds: 1));
        if (mounted) Navigator.pop(context, note);
      }
    } catch (e) {
      _showSnack('Something went wrong. Please try again.');
    } finally {
      if (mounted) setState(() => _isSubmitting = false);
    }
  }
}
