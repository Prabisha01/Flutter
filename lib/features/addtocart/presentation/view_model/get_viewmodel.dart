
import 'package:final_project/features/addtocart/data/data_source/cart_data_source.dart';
import 'package:final_project/features/addtocart/domain/entity/cart_entity.dart';
import 'package:final_project/features/addtocart/presentation/state/cart_sate.dart';
import 'package:final_project/features/wishlist/presentation/state/wishlist_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getCartViewModelProvider =
    StateNotifierProvider<GetCartViewModel, CartState>((ref) {
  final cartRemoteDataSource = ref.read(cartRemoteDataSourceProvider);
  return GetCartViewModel(cartRemoteDataSource);
});
 
class GetCartViewModel extends StateNotifier<CartState> {
  final CartRemoteDataSource cartRemoteDataSource;
 
  GetCartViewModel(this.cartRemoteDataSource)
      : super(CartState.initialState()) {
    getCart();
  }
 
 
  Future resetState() async {
    state = CartState.initialState();
    getCart();
  }
 
  Future<void> removeFromCart(CartEntity cartId) async {
    try {
      await cartRemoteDataSource.removeFromCart(cartId);
    } catch (error) {
      print(error.toString());
    }
  }
  Future getCart() async {
    state = state.copyWith(isLoading: true);
 
    final currentState = state;
    final page = currentState.page + 1;
    final carts = currentState.carts;
    final hasReachedMax = currentState.hasReachedMax;
    if (!hasReachedMax) {
      // get data from data source
      final result = await cartRemoteDataSource.getCart(page);
      result.fold(
        (failure) =>
            state = state.copyWith(hasReachedMax: true, isLoading: false),
        (data) {
          if (data.isEmpty) {
            state = state.copyWith(hasReachedMax: true);
          } else {
            state = state.copyWith(
              carts: [...carts, ...data],
              page: page,
              isLoading: false,
            );
          }
        },
      );
    }
  }
}