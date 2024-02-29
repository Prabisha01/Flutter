
import 'package:final_project/features/product/domain/use_case/nursy_usecase.dart';
import 'package:final_project/features/product/presentation/state/nursy_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final nursyViewModelProvider =
    StateNotifierProvider<NursyViewModel, NursyState>(
  (ref) {
    return NursyViewModel(ref.read(nursyUsecaseProvider));
  },
);

class NursyViewModel extends StateNotifier<NursyState> {
  final NursyUseCase nursyUseCase;

  NursyViewModel(this.nursyUseCase) : super(NursyState.initial()) {
    getAllProducts();
  }

  getAllProducts() async {
    state = state.copyWith(isLoading: true);
    var data = await nursyUseCase.getAllProducts();

    data.fold(
      (l) => state = state.copyWith(isLoading: false, error: l.error),
      (r) => state = state.copyWith(isLoading: false, products: r, error: null),
    );
  }
}
