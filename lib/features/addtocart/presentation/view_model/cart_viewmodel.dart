import 'package:final_project/features/addtocart/data/data_source/cart_data_source.dart';
import 'package:final_project/features/addtocart/domain/entity/cart_entity.dart';
import 'package:final_project/features/addtocart/domain/usecase/addtocart_usecase.dart';
import 'package:final_project/features/addtocart/presentation/state/cart_sate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Import your cart-related dependencies and entities

final cartViewModelProvider =
    StateNotifierProvider<CartViewModel, CartState>(
  (ref) => CartViewModel(
    ref.read(addToCartUseCaseProvider),
    ref.read(cartRemoteDataSourceProvider),
    // Add other dependencies if needed
  ),
);

class CartViewModel extends StateNotifier<CartState> {
  final AddToCartUseCase _addToCartUseCase;
    final CartRemoteDataSource cartRemoteDataSource;

  CartViewModel(
    this._addToCartUseCase,
    this.cartRemoteDataSource,
  ) : super(CartState.initialState());

  Future<void> addToCart(
      CartEntity entity, BuildContext context) async {
    state = state.copyWith(isLoading: true);
    final result = await _addToCartUseCase.addToCart(entity);
    state = state.copyWith(isLoading: false);
    result.fold(
      (failure) => state = state.copyWith(error: failure.error),
      (success) => state = state.copyWith(isLoading: false, showMessage: true),
    );
    // showSnackBar(message: state.message!, context: context);
  }
Future<void> removeFromCart(CartEntity cartId) async {
    try {
      await cartRemoteDataSource.removeFromCart(cartId);
    } catch (error) {
      print(error.toString());
    }
  }
  

  void reset() {
    state = state.copyWith(
      isLoading: false,
      error: null,
      showMessage: false,
    );
  }

  void resetMessage() {
    state = state.copyWith(
      showMessage: false,
      error: null,
      isLoading: false,
    );
  }
}
