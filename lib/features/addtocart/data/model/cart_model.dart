import 'package:final_project/features/addtocart/domain/entity/cart_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cart_model.g.dart';

@JsonSerializable()
class CartAPIModel {
  @JsonKey(name: "_id")
  final String? cartId;
  final String? userId;
  final String? plantId;
  final String addedAt;
  final int quantity;

  CartAPIModel({
    this.cartId,
    this.userId,
    required this.quantity,
    required this.addedAt,
    this.plantId
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

  factory CartAPIModel.fromJson(Map<String, dynamic> json) {
    return CartAPIModel(
      cartId: json['_id'],
      userId: json['userId'] ,
      plantId: json['plantId']['plantName'],
      quantity: json['quantity'],
      addedAt: json['addedAt']
    );
  }

  // From entity to model
  factory CartAPIModel.fromEntity(CartEntity entity) {
    return CartAPIModel(
      cartId: entity.cartId,
      userId: entity.userId,
      plantId: entity.plantId,
      addedAt: entity.addedAt.toIso8601String(), 
      quantity: entity.quantity,
    );
  }

  // From model to entity
  static CartEntity toEntity(CartAPIModel model) {
    return CartEntity(
      cartId: model.cartId,
      userId: model.userId,
      plantId: model.plantId,
     addedAt: DateTime.parse(model.addedAt),
     quantity: model.quantity
      
    );
  }
}
