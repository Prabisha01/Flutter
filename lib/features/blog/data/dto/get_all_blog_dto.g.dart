// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_blog_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllBlogDTO _$GetAllBlogDTOFromJson(Map<String, dynamic> json) =>
    GetAllBlogDTO(
      success: json['success'] as bool,
      message: json['message'] as String,
      blogs: (json['blogs'] as List<dynamic>)
          .map((e) => BlogApiModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetAllBlogDTOToJson(GetAllBlogDTO instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'blogs': instance.blogs,
    };
