import 'package:final_project/features/blog/domain/entity/blog_entity.dart';


class BlogState {
  final bool isLoading;
  final List<BlogEntity> blogs;
  final String? error;

  BlogState({
    required this.isLoading,
    required this.blogs,
    this.error,
  });

  factory BlogState.initial() {
    return BlogState(
      isLoading: false,
      blogs: [],
    );
  }

  BlogState copyWith({
    bool? isLoading,
    List<BlogEntity>? blogs,
    String? error,
  }) {
    return BlogState(
      isLoading: isLoading ?? this.isLoading,
      blogs: blogs ?? this.blogs,
      error: error ?? this.error,
    );
  }
}
