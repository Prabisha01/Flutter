// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartAPIModel _$CartAPIModelFromJson(Map<String, dynamic> json) => CartAPIModel(
      cartId: json['_id'] as String?,
      userId: json['userId'] as String?,
      quantity: json['quantity'] as int,
      addedAt: json['addedAt'] as String,
      plantId: json['plantId'] as String?,
    );

Map<String, dynamic> _$CartAPIModelToJson(CartAPIModel instance) =>
    <String, dynamic>{
      '_id': instance.cartId,
      'userId': instance.userId,
      'plantId': instance.plantId,
      'addedAt': instance.addedAt,
      'quantity': instance.quantity,
    };
