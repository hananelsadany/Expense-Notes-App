// cart_dto.dart
import 'package:expense_notes_app/data/model/expense_note_model.dart';
import 'package:expense_notes_app/data/remote/dto/cart_product_dto.dart';

class CartDto {
  final int id;
  final int userId;
  final List<CartProductDto> products;

  CartDto({required this.id, required this.userId, required this.products});

  factory CartDto.fromJson(Map<String, dynamic> json) {
    return CartDto(
      id: json['id'],
      userId: json['userId'],
      products: (json['products'] as List)
          .map((p) => CartProductDto.fromJson(p))
          .toList(),
    );
  }

  ExpenseNoteModel toModel() {
    return ExpenseNoteModel(
      uuid: id.toString(),
      title: 'Cart #$id',
      userId: userId.toString(),
      status: 'submitted',
      syncStatus: 'synced',
      creationDate: DateTime.now(),
      updateDate: DateTime.now(),
    );
  }
}
