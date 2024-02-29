import 'package:equatable/equatable.dart';
import 'package:final_project/config/constants/hive_table_constant.dart';
import 'package:final_project/features/blog/domain/entity/blog_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';

part 'blog_hive_model.g.dart';

final blogHiveModelProvider  = Provider((ref) => BlogHiveModel.empty(),
);
@HiveType(typeId: HiveTableConstant.blogTableId)
class BlogHiveModel extends  Equatable{
  @HiveField(0)
  final String blogId;

  @HiveField(1)
  final String blogTitle;

  @HiveField(2)
  final String blogAuthor;

  @HiveField(3)
  final String blogContent;

  @HiveField(4)
  final String blogCategory;

  @HiveField(5)
  final DateTime blogDate;

  @HiveField(6)
  final String blogImageUrl;

  BlogHiveModel.empty() : this(blogId : '', blogTitle : '' , blogCategory : '' , blogAuthor: '', blogContent: '', blogDate :DateTime.now(),blogImageUrl : '' );

  BlogHiveModel({
    String? blogId,
    required this.blogTitle,
    required this.blogAuthor,
    required this.blogCategory,
    required this.blogContent,
    required this.blogDate,
    required this.blogImageUrl
  }): blogId = blogId ?? const Uuid().v4();

  BlogEntity toEntity() => BlogEntity(
    blogId: blogId,
    blogTitle: blogTitle, 
    blogAuthor: blogAuthor, 
    blogContent: blogContent, 
    blogCategory: blogCategory, 
    blogImageUrl: blogImageUrl, 
    blogDate: blogDate,
    );

    BlogHiveModel toHiveModel(BlogEntity entity) => BlogHiveModel(
      blogTitle: entity.blogTitle, 
      blogAuthor: entity.blogAuthor,
       blogCategory: entity.blogCategory, 
       blogContent: entity.blogContent,
        blogDate: entity.blogDate, 
        blogImageUrl: entity.blogImageUrl
        );

      List<BlogEntity> toEntityList(List<BlogHiveModel> models)=>
      models.map((model) => model.toEntity()).toList();

      @override 
      String toString(){
        return 'blogId : $blogId, blogTitle : $blogTitle, blogDate: $blogDate, blogContent : $blogContent, blogAuthor: $blogAuthor, blogCategory: $blogCategory, blogImageUrl : $blogImageUrl';

      }

@override
  List <Object ?> get props => [blogId, blogTitle, blogCategory, blogContent, blogDate, blogImageUrl, blogAuthor];
  
}