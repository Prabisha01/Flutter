import 'package:final_project/features/product/domain/entity/nursy_entity.dart';

class NursySearchState {
  final bool isLoading;
  final List<NursyEntity> searchResults;
  final String? error;

  NursySearchState({
    required this.isLoading,
    required this.searchResults,
    this.error,
  });

  factory NursySearchState.initial() {
    return NursySearchState(
      isLoading: false,
      searchResults: [],
    );
  }

  NursySearchState copyWith({
    bool? isLoading,
    List<NursyEntity>? searchResults,
    String? error,
  }) {
    return NursySearchState(
      isLoading: isLoading ?? this.isLoading,
      searchResults: searchResults ?? this.searchResults,
      error: error ?? this.error,
    );
  }
}