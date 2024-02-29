import 'package:final_project/features/blog/domain/use_case/blog_use_case.dart';
import 'package:final_project/features/blog/presentation/state/blog_state.dart';
// import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final blogViewModelProvider =
    StateNotifierProvider<BlogViewModel, BlogState>(
  (ref) {
    return BlogViewModel(ref.read(blogUsecaseProvider));
  },
);

class BlogViewModel extends StateNotifier<BlogState> {
  final BlogUseCase blogUseCase;

  BlogViewModel(this.blogUseCase) : super(BlogState.initial()) {
    getAllBlogs();
  }

  getAllBlogs() async {
    state = state.copyWith(isLoading: true);
    var data = await blogUseCase.getAllBlogs();

    data.fold(
      (l) => state = state.copyWith(isLoading: false, error: l.error),
      (r) => state = state.copyWith(isLoading: false, blogs: r, error: null),
    );
  }
}
