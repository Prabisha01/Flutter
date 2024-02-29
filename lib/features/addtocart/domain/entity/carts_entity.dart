import 'package:equatable/equatable.dart';

class CartsEntity extends Equatable {
  final String? cartId;
  final String? userId;
  final Map<String, dynamic>? plantId;
  final DateTime addedAt;
  final int quantity;

  const CartsEntity({
    this.cartId,
    this.userId,
    required this.plantId,
     required this.quantity,
    required this.addedAt,
  });

  @override
  List<Object?> get props => [cartId, userId, plantId, addedAt, quantity];

  factory CartsEntity.fromJson(Map<String, dynamic> json) => CartsEntity(
      cartId: json['cartId'],
      userId: json['userId'],
      plantId: json['plantId'],
      quantity: json['quantity'],
      addedAt: json['addedAt']);

  @override
  String toString() {
    return 'CartEntity( cartId : $cartId , userId: $userId, plantId: $plantId , addedAt: $addedAt, quantity : $quantity)';
  }

  CartsEntity copyWith(
      {required Map<String, dynamic>? plantId,
      DateTime? addedAt,
      String? userId,
      int? quantity // Include userId in copyWith
      }) {
    return CartsEntity(
        plantId: plantId,
        addedAt: addedAt ?? this.addedAt,
        userId: userId ?? this.userId,
        quantity: quantity ?? this.quantity
        );
  }
}
