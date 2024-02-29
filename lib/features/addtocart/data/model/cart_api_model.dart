import 'package:final_project/features/addtocart/domain/entity/cart_entity.dart';
import 'package:final_project/features/addtocart/domain/entity/carts_entity.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class CartsAPIModel {
  @JsonKey(name: "_id")
  final String? cartId;
  final String? userId;
  final Map<String, dynamic>? plantId;
  final String addedAt;
  final int quantity;

  CartsAPIModel({
    this.cartId,
    this.userId,
    required this.quantity,
    required this.addedAt,
    required this.plantId
  });

  Map<String, dynamic> toJson() {
    return {
      'cartId': cartId,
      'userId': userId,
      'addedAt': addedAt,
      'plantId': plantId,
      'quantity': quantity,
   
    };
  }

  factory CartsAPIModel.fromJson(Map<String, dynamic> json) {
    return CartsAPIModel(
      cartId: json['_id'],
      userId: json['userId'] ,
      plantId: json['plantId'],
      quantity: json['quantity'],
      addedAt: json['addedAt']
    );
  }

  // From entity to model
  factory CartsAPIModel.fromEntity(CartsEntity entity) {
    return CartsAPIModel(
      cartId: entity.cartId,
      userId: entity.userId,
      plantId: entity.plantId,
      addedAt: entity.addedAt.toIso8601String(), 
      quantity: entity.quantity,
    );
  }

  // From model to entity
  static CartsEntity toEntity(CartsAPIModel model) {
    return CartsEntity(
      cartId: model.cartId,
      userId: model.userId,
      plantId: model.plantId,
     addedAt: DateTime.parse(model.addedAt),
     quantity: model.quantity
      
    );
  }
}
