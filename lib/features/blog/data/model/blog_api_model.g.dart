// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blog_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BlogApiModel _$BlogApiModelFromJson(Map<String, dynamic> json) => BlogApiModel(
      blogId: json['_id'] as String?,
      blogTitle: json['blogTitle'] as String,
      blogAuthor: json['blogAuthor'] as String,
      blogCategory: json['blogCategory'] as String,
      blogContent: json['blogContent'] as String,
      blogDate: DateTime.parse(json['blogDate'] as String),
      blogImageUrl: json['blogImageUrl'] as String,
    );

Map<String, dynamic> _$BlogApiModelToJson(BlogApiModel instance) =>
    <String, dynamic>{
      '_id': instance.blogId,
      'blogTitle': instance.blogTitle,
      'blogContent': instance.blogContent,
      'blogAuthor': instance.blogAuthor,
      'blogDate': instance.blogDate.toIso8601String(),
      'blogCategory': instance.blogCategory,
      'blogImageUrl': instance.blogImageUrl,
    };
