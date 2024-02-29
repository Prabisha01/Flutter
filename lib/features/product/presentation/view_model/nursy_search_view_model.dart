import 'package:final_project/features/product/domain/use_case/nursy_usecase.dart';
import 'package:final_project/features/product/presentation/state/nursy_search_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final nursySearchViewModelProvider =
    StateNotifierProvider<NursySearchViewModel, NursySearchState>(
  (ref) {
    return NursySearchViewModel(ref.read(nursyUsecaseProvider));
  },
);

class NursySearchViewModel extends StateNotifier<NursySearchState> {
  final NursyUseCase nursyUseCase;

  NursySearchViewModel(this.nursyUseCase) : super(NursySearchState.initial());

  searchProducts(String searchQuery) async {
    state = state.copyWith(isLoading: true);

    var data = await nursyUseCase.searchProducts(searchQuery);

    data.fold(
      (l) => state = state.copyWith(isLoading: false, error: l.error),
      (r) => state = state.copyWith(isLoading: false, searchResults: r, error: null),
    );
  }
}
