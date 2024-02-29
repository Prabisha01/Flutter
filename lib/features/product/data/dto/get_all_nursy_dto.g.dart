// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_nursy_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllNursyDTO _$GetAllNursyDTOFromJson(Map<String, dynamic> json) =>
    GetAllNursyDTO(
      success: json['success'] as bool,
      message: json['message'] as String,
      products: (json['products'] as List<dynamic>)
          .map((e) => NursyAPIModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetAllNursyDTOToJson(GetAllNursyDTO instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'products': instance.products,
    };
