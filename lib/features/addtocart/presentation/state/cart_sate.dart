import 'package:final_project/features/addtocart/domain/entity/cart_entity.dart';

class CartState {
  final bool isLoading;
  final String? error;
  final List<CartEntity> carts;
  final bool? showMessage;
  final String? message;
  final int page;
  final bool hasReachedMax;

  CartState(
      {required this.isLoading,
      this.error,
      required this.carts,
      this.showMessage,
      required this.page,
      this.message,
      required this.hasReachedMax});

  factory CartState.initialState() {
    return CartState(
        isLoading: false,
        error: null,
        carts: [],
        showMessage: false,
        message: null,
        hasReachedMax: false,
        page: 0);
  }

  CartState copyWith(
      {bool? isLoading,
      String? error,
      bool? showMessage,
      List<CartEntity>? carts,
      String? message,
      bool? hasReachedMax,
      int? page}) {
    return CartState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      showMessage: showMessage ?? this.showMessage,
      message: message ?? this.message,
      carts: carts ?? this.carts,
      page: page ?? this.page,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }
}
