// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_cart_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCartDTO _$GetCartDTOFromJson(Map<String, dynamic> json) => GetCartDTO(
      success: json['success'] as bool,
      message: json['message'] as String,
      carts: (json['carts'] as List<dynamic>)
          .map((e) => CartsAPIModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetCartDTOToJson(GetCartDTO instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'carts': instance.carts,
    };
