import '../database/app_database.dart';
import 'package:drift/drift.dart';

class ExpenseLineModel {
  final String uuid;
  final String noteUuid;
  final String description;
  final String? categoryUuid;
  final double quantity;
  final double unitPrice;

  double get lineTotal => quantity * unitPrice;

  const ExpenseLineModel({
    required this.uuid,
    required this.noteUuid,
    required this.description,
    this.categoryUuid,
    required this.quantity,
    required this.unitPrice,
  });

  factory ExpenseLineModel.fromJson(Map<String, dynamic> json) {
    return ExpenseLineModel(
      uuid: json['uuid'],
      noteUuid: json['note_uuid'],
      description: json['description'],
      categoryUuid: json['category_uuid'],
      quantity: (json['quantity'] as num).toDouble(),
      unitPrice: (json['unit_price'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() => {
    'uuid': uuid,
    'note_uuid': noteUuid,
    'description': description,
    'category_uuid': categoryUuid,
    'quantity': quantity,
    'unit_price': unitPrice,
  };

  ExpenseLineModel copyWith({
    String? uuid,
    String? noteUuid,
    String? description,
    String? categoryUuid,
    double? quantity,
    double? unitPrice,
  }) {
    return ExpenseLineModel(
      uuid: uuid ?? this.uuid,
      noteUuid: noteUuid ?? this.noteUuid,
      description: description ?? this.description,
      categoryUuid: categoryUuid ?? this.categoryUuid,
      quantity: quantity ?? this.quantity,
      unitPrice: unitPrice ?? this.unitPrice,
    );
  }

  ExpenseLinesCompanion toCompanion() {
    return ExpenseLinesCompanion(
      uuid: Value(uuid),
      noteUuid: Value(noteUuid),
      description: Value(description),
      categoryUuid: Value(categoryUuid),
      quantity: Value(quantity),
      unitPrice: Value(unitPrice),
    );
  }
}
