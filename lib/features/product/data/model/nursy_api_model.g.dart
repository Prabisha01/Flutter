// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nursy_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NursyAPIModel _$NursyAPIModelFromJson(Map<String, dynamic> json) =>
    NursyAPIModel(
      plantId: json['_id'] as String?,
      plantName: json['plantName'] as String,
      plantPrice: json['plantPrice'] as int,
      plantDescription: json['plantDescription'] as String,
      plantCategory: json['plantCategory'] as String,
      plantImageUrl: json['plantImageUrl'] as String,
    );

Map<String, dynamic> _$NursyAPIModelToJson(NursyAPIModel instance) =>
    <String, dynamic>{
      '_id': instance.plantId,
      'plantName': instance.plantName,
      'plantPrice': instance.plantPrice,
      'plantDescription': instance.plantDescription,
      'plantCategory': instance.plantCategory,
      'plantImageUrl': instance.plantImageUrl,
    };
