import 'package:equatable/equatable.dart';

class CartEntity extends Equatable {
  final String? cartId;
  final String? userId;
  final String? plantId;
  final DateTime addedAt;
  final int quantity;

  const CartEntity({
    this.cartId,
    this.userId,
    this.plantId,
     required this.quantity,
    required this.addedAt,
  });

  @override
  List<Object?> get props => [cartId, userId, plantId, addedAt, quantity];

  factory CartEntity.fromJson(Map<String, dynamic> json) => CartEntity(
      cartId: json['cartId'],
      userId: json['userId'],
      plantId: json['plantId']['plantName'],
      quantity: json['quantity'],
      addedAt: json['addedAt']);

  @override
  String toString() {
    return 'CartEntity( cartId : $cartId , userId: $userId, plantId: $plantId , addedAt: $addedAt, quantity : $quantity)';
  }

  CartEntity copyWith(
      {String? plantId,
      DateTime? addedAt,
      String? userId,
      int? quantity // Include userId in copyWith
      }) {
    return CartEntity(
        plantId: plantId ?? this.plantId,
        addedAt: addedAt ?? this.addedAt,
        userId: userId ?? this.userId,
        quantity: quantity ?? this.quantity
        );
  }
}
