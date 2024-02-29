import 'package:dartz/dartz.dart';
import 'package:final_project/core/failure/failure.dart';
import 'package:final_project/features/blog/data/data_source/blog_remote_data_source.dart';
import 'package:final_project/features/blog/domain/entity/blog_entity.dart';
import 'package:final_project/features/blog/domain/repository/blog_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final blogRemoteRepositoryProvider = Provider<IBlogRepository>(
  (ref) => BlogRemoteRepositoryImpl(
    blogRemoteDataSource: ref.read(blogRemoteDataSourceProvider),
  ),
);

class BlogRemoteRepositoryImpl implements IBlogRepository {
  final BlogRemoteDataSource blogRemoteDataSource;

  BlogRemoteRepositoryImpl({required this.blogRemoteDataSource});

  @override
  Future<Either<Failure, List<BlogEntity>>> getAllBlogs() {
    return blogRemoteDataSource.getAllBlogs();
  }
}
