import 'package:dartz/dartz.dart';
import 'package:final_project/core/failure/failure.dart';
import 'package:final_project/features/blog/data/data_source/blog_local_data_source.dart';
import 'package:final_project/features/blog/domain/entity/blog_entity.dart';
import 'package:final_project/features/blog/domain/repository/blog_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final blogLocalRepositoryProvider = Provider<IBlogRepository>((ref) {
  return BlogLocalRepositoryImpl(
    blogLocalDataSource : ref.read(blogLocalDataSourceProvider),
  );
});

class BlogLocalRepositoryImpl implements IBlogRepository {
  final BlogLocalDataSource blogLocalDataSource;

  BlogLocalRepositoryImpl({
    required this.blogLocalDataSource,

  });

  @override
  Future<Either<Failure, List<BlogEntity>>> getAllBlogs() {
  
    return blogLocalDataSource.getAllBlogs();
  }
  
  }