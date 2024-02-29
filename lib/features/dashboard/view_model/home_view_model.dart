
import 'package:final_project/features/dashboard/presentation/state/home_state.dart';
import 'package:final_project/features/product/domain/use_case/nursy_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeViewModelProvider= StateNotifierProvider.autoDispose<HomeViewModel,HomeState>(
  (ref)=> HomeViewModel(nursyUseCase: ref.read(nursyUsecaseProvider))
);

class HomeViewModel extends StateNotifier<HomeState>{
  final NursyUseCase nursyUseCase;
  HomeViewModel({required this.nursyUseCase}): super(HomeState.initialState())
  {
    getAllData();
  }

  void changeIndex(int index){
    state=state.copyWith(index:index);
  }

  void getAllData(){
    state= state.copyWith(isLoading: true);
    nursyUseCase.getAllProducts().then((value) {
      value.fold((l) => state= state.copyWith(isLoading: false), (r) => state= state.copyWith(products: r,isLoading: false));
    });
  }
}