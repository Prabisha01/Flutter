import 'package:equatable/equatable.dart';

class BlogEntity extends Equatable {
  final String? blogId;
  final String blogTitle;
  final String blogAuthor;
  final String blogContent;
  final String blogCategory;
  final String blogImageUrl;
  final DateTime blogDate;

  @override
  List<Object?> get props => [
        blogId,
        blogTitle,
        blogAuthor,
        blogCategory,
        blogContent,
        blogDate,
        blogImageUrl
      ];

  const BlogEntity({
    this.blogId,
    required this.blogTitle,
    required this.blogAuthor,
    required this.blogContent,
    required this.blogCategory,
    required this.blogImageUrl,
    required this.blogDate,
  });

  factory BlogEntity.fromJson(Map<String, dynamic> json) => BlogEntity(
        blogId: json['blogId'],
        blogTitle: json['blogTitle'],
        blogAuthor: json['blogAuthor'],
        blogCategory: json['blogCategory'],
        blogContent: json['blogContent'],
        blogImageUrl: json['blogImageUrl'],
        blogDate : DateTime.parse(json['blogDate']),
      );

  @override
  String toString() {
    return 'BlogEntity(blogId: $blogId, blogTitle: $blogTitle, blogAuthor: $blogAuthor, blogContent : $blogContent, blogCategory : $blogCategory)';
  }
}
