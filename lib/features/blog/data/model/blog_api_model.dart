
import 'package:final_project/features/blog/domain/entity/blog_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'blog_api_model.g.dart';

@JsonSerializable()
class BlogApiModel {
  @JsonKey(name: '_id')
  final String? blogId;
  final String blogTitle;
  final String blogContent;
  final String blogAuthor;
  final DateTime blogDate;
  final String blogCategory;
  final String blogImageUrl;

  BlogApiModel({
    this.blogId,
    required this.blogTitle,
    required this.blogAuthor,
    required this.blogCategory,
    required this.blogContent,
    required this.blogDate,
    required this.blogImageUrl,
  });

  Map<String, dynamic> toJson() {
    return {
      'blogTitle': blogTitle,
      'blogAuthor': blogAuthor,
      'blogCategory': blogCategory,
      'blogContent': blogContent,
      'blogDate': blogDate,
      'blogImageUrl': blogImageUrl,
    };
  }

  factory BlogApiModel.fromJson(Map<String, dynamic> json) {
    return BlogApiModel(
        blogId: json['_id'],
        blogTitle: json['blogTitle'] as String,
        blogAuthor: json['blogAuthor'] as String,
        blogCategory: json['blogCategory'] as String,
        blogContent: json['blogContent'] as String,
        blogDate: DateTime.parse(json['blogDate'] as String),
        blogImageUrl: json['blogImageUrl'] as String);
  }

  BlogEntity toEntity(BlogApiModel model) => BlogEntity(
        blogId: model.blogId,
        blogTitle: model.blogTitle,
        blogAuthor: model.blogAuthor,
        blogContent: model.blogContent,
        blogCategory: model.blogCategory,
        blogImageUrl: model.blogImageUrl,
        blogDate: model.blogDate,
      );

  BlogEntity toAnEntity() => BlogEntity(
        blogId: blogId,
        blogTitle: blogTitle,
        blogAuthor: blogAuthor,
        blogContent: blogContent,
        blogCategory: blogCategory,
        blogImageUrl: blogImageUrl,
        blogDate: blogDate,
      );

  BlogApiModel fromEntity(BlogEntity entity) => BlogApiModel(
        blogId: entity.blogId,
        blogTitle: entity.blogTitle,
        blogAuthor: entity.blogAuthor,
        blogCategory: entity.blogCategory,
        blogContent: entity.blogContent,
        blogDate: entity.blogDate,
        blogImageUrl: entity.blogImageUrl,
      );

  List<BlogEntity> toEntityList(List<BlogApiModel> models) =>
      models.map((model) => model.toAnEntity()).toList();
}
