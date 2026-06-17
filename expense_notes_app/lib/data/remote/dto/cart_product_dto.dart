// cart_product_dto.dart
import 'package:expense_notes_app/data/model/expense_line_model.dart';

class CartProductDto {
  final int id;
  final String title;
  final double price;
  final int quantity;

  CartProductDto({
    required this.id,
    required this.title,
    required this.price,
    required this.quantity,
  });

  factory CartProductDto.fromJson(Map<String, dynamic> json) {
    return CartProductDto(
      id: json['id'],
      title: json['title'],
      price: (json['price'] as num).toDouble(),
      quantity: json['quantity'],
    );
  }

  ExpenseLineModel toModel(String noteUuid) {
    return ExpenseLineModel(
      uuid: '${noteUuid}_$id',
      noteUuid: noteUuid,
      description: title,
      quantity: quantity.toDouble(),
      unitPrice: price,
    );
  }
}
