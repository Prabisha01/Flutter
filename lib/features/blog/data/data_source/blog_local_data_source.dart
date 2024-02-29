import 'package:dartz/dartz.dart';
import 'package:final_project/core/failure/failure.dart';
import 'package:final_project/core/network/local/hive_service.dart';
import 'package:final_project/features/blog/data/model/blog_hive_model.dart';
import 'package:final_project/features/blog/domain/entity/blog_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final blogLocalDataSourceProvider = Provider<BlogLocalDataSource>((ref){
  return BlogLocalDataSource(
    hiveService: ref.read(hiveServiceProvider),
    blogHiveModel : ref.read(blogHiveModelProvider));

});
class BlogLocalDataSource{
  final HiveService hiveService;
  final BlogHiveModel blogHiveModel;

  BlogLocalDataSource({
    required this.hiveService,
    required this.blogHiveModel
  });

  Future<Either<Failure, List <BlogEntity>>> getAllBlogs() async {
    try {
      final blogs = await hiveService.getAllBlogs();
      final blogEntities = blogHiveModel.toEntityList(blogs);
      return Right(blogEntities);


    }catch (e){
      return Left(Failure(error: e.toString()));
    }
  }

}
