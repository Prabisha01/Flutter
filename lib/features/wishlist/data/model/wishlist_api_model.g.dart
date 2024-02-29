// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wishlist_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WishlistAPIModel _$WishlistAPIModelFromJson(Map<String, dynamic> json) =>
    WishlistAPIModel(
      wishlistId: json['_id'] as String?,
      userId: json['userId'] as String?,
      plantId: json['plantId'] as String?,
      addedAt: json['addedAt'] as String,
    );

Map<String, dynamic> _$WishlistAPIModelToJson(WishlistAPIModel instance) =>
    <String, dynamic>{
      '_id': instance.wishlistId,
      'userId': instance.userId,
      'plantId': instance.plantId,
      'addedAt': instance.addedAt,
    };
