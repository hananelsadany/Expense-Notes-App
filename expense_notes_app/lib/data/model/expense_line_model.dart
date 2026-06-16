class ExpenseLineModel {
  final String uuid;
  final String noteUuid;
  final String description;
  final String? categoryUuid;
  final double quantity;
  final double unitPrice;
  final double lineTotal;

  ExpenseLineModel({
    required this.uuid,
    required this.noteUuid,
    required this.description,
    this.categoryUuid,
    required this.quantity,
    required this.unitPrice,
    double? lineTotal,
  }) : lineTotal = lineTotal ?? quantity * unitPrice;

  factory ExpenseLineModel.fromMap(Map<String, dynamic> map) {
    return ExpenseLineModel(
      uuid: map['uuid'],
      noteUuid: map['note_uuid'],
      description: map['description'],
      categoryUuid: map['category_uuid'],
      quantity: map['quantity'],
      unitPrice: map['unit_price'],
      lineTotal: map['line_total'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uuid': uuid,
      'note_uuid': noteUuid,
      'description': description,
      'category_uuid': categoryUuid,
      'quantity': quantity,
      'unit_price': unitPrice,
      'line_total': lineTotal,
    };
  }
}