// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContactAPIModel _$ContactAPIModelFromJson(Map<String, dynamic> json) =>
    ContactAPIModel(
      contactId: json['_id'] as String?,
      contactName: json['contactName'] as String,
      contactEmail: json['contactEmail'] as String,
      contactMessage: json['contactMessage'] as String,
    );

Map<String, dynamic> _$ContactAPIModelToJson(ContactAPIModel instance) =>
    <String, dynamic>{
      '_id': instance.contactId,
      'contactName': instance.contactName,
      'contactEmail': instance.contactEmail,
      'contactMessage': instance.contactMessage,
    };
