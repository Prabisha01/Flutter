import 'package:final_project/features/blog/presentation/view/blog_view.dart';
import 'package:final_project/features/dashboard/presentation/view/bottom/dashboard_view.dart';
import 'package:final_project/features/dashboard/presentation/view/bottom/product_view.dart';
import 'package:final_project/features/product/domain/entity/nursy_entity.dart';
import 'package:final_project/features/product/presentation/view/product_view.dart';
import 'package:final_project/features/profile/presentation/view/profile_view.dart';
import 'package:flutter/widgets.dart';

class HomeState {
  final int index;
  final bool isLoading;
  final List<NursyEntity> products;
  final List<Widget> lstWidgets;

  HomeState(
      {required this.index,
      required this.lstWidgets,
      required this.isLoading,
      required this.products});

  HomeState.initialState()
      : index = 0,
        isLoading = false,
        products = [],
        lstWidgets = [
          const DashboardView(),
          const BlogView(),
          const ProfileView(),
          const ProfileView(),
        ];

  // CopyWith function to change the index no
  HomeState copyWith({
    int? index,
    bool? isLoading,
    List<NursyEntity>? products,
  }) {
    return HomeState(
      index: index ?? this.index,
      isLoading: isLoading ?? this.isLoading,
      lstWidgets: lstWidgets,
      products: products ?? this.products,
    );
  }
}
