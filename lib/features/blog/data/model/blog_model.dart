import 'package:json_annotation/json_annotation.dart';

part 'blog_model.g.dart';

@JsonSerializable()
class BlogModel {
  @JsonKey(name : '_id')
  final String? blodId;
  final String blogTitle;
  final String blogContent;
  final String blogAuthor;
  final DateTime blogDate;
  final String blogCategory;
  final String blogImageUrl;

  BlogModel ({
    this.blodId,
    required this.blogTitle,
    required this.blogAuthor,
    required this.blogCategory,
    required this.blogContent,
    required this.blogDate,
    required this.blogImageUrl,
  });
  factory BlogModel.fromJson(Map<String, dynamic> json) =>
  _$BlogModelFromJson(json);

  Map<String, dynamic > toJson() => _$BlogModelToJson(this);


  
}