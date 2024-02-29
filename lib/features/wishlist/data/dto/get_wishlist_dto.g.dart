// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_wishlist_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetWishlistDTO _$GetWishlistDTOFromJson(Map<String, dynamic> json) =>
    GetWishlistDTO(
      success: json['success'] as bool,
      message: json['message'] as String,
      wishlists: (json['wishlists'] as List<dynamic>)
          .map((e) => WishlistsAPIModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetWishlistDTOToJson(GetWishlistDTO instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'wishlists': instance.wishlists,
    };
