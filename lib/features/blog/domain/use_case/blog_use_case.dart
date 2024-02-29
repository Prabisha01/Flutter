
import 'package:dartz/dartz.dart';
import 'package:final_project/core/failure/failure.dart';
import 'package:final_project/features/blog/domain/entity/blog_entity.dart';
import 'package:final_project/features/blog/domain/repository/blog_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final blogUsecaseProvider = Provider<BlogUseCase>(
  (ref) => BlogUseCase(
    blogRepository: ref.watch(blogRepositoryProvider),
  ),
);

class BlogUseCase {
  final IBlogRepository blogRepository;

  BlogUseCase({required this.blogRepository});

  Future<Either<Failure, List<BlogEntity>>> getAllBlogs() {
    return blogRepository.getAllBlogs();
  }
}