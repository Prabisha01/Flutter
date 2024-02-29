// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blog_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BlogModel _$BlogModelFromJson(Map<String, dynamic> json) => BlogModel(
      blodId: json['_id'] as String?,
      blogTitle: json['blogTitle'] as String,
      blogAuthor: json['blogAuthor'] as String,
      blogCategory: json['blogCategory'] as String,
      blogContent: json['blogContent'] as String,
      blogDate: DateTime.parse(json['blogDate'] as String),
      blogImageUrl: json['blogImageUrl'] as String,
    );

Map<String, dynamic> _$BlogModelToJson(BlogModel instance) => <String, dynamic>{
      '_id': instance.blodId,
      'blogTitle': instance.blogTitle,
      'blogContent': instance.blogContent,
      'blogAuthor': instance.blogAuthor,
      'blogDate': instance.blogDate.toIso8601String(),
      'blogCategory': instance.blogCategory,
      'blogImageUrl': instance.blogImageUrl,
    };
