
import 'package:final_project/features/product/domain/entity/nursy_entity.dart';


class NursyState {
  final bool isLoading;
  final List<NursyEntity> products;
  final String? error;

   NursyState({
    required this.isLoading,
    required this.products,
    this.error,
  });

  factory NursyState.initial() {
    return NursyState(
      isLoading: false,
      products: [],
    );
  }

  NursyState copyWith({
    bool? isLoading,
    List<NursyEntity>? products,
    String? error,
  }) {
    return NursyState(
      isLoading: isLoading ?? this.isLoading,
      products: products ?? this.products,
      error: error ?? this.error,
    );
  }
}
