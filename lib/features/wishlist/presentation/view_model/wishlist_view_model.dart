
import 'package:final_project/features/wishlist/domain/entity/wishlist_entity.dart';
import 'package:final_project/features/wishlist/domain/use_case/add_to_wishlist.dart';
import 'package:final_project/features/wishlist/presentation/state/wishlist_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final wishlistViewModelProvider =
    StateNotifierProvider<WishlistViewModel, WishlistState>(
  (ref) => WishlistViewModel(
    ref.read(addToWishlistUseCaseProvider),
  ),
);

class WishlistViewModel extends StateNotifier<WishlistState> {
  final AddToWishlistUseCase _addToWishlistUseCase;

  WishlistViewModel(
    this._addToWishlistUseCase,
  ) : super(WishlistState.initialState());

  Future<void> addToWishlist(
      WishlistEntity entity, BuildContext context) async {
    state = state.copywith(isLoading: true);
    final result = await _addToWishlistUseCase.addToWishlist(entity);
    state = state.copywith(isLoading: false);
    result.fold(
      (failure) => state = state.copywith(error: failure.error),
      (success) => state = state.copywith(isLoading: false, showMessage: true),
    );
    // showSnackBar(message: state.message!, context: context);
  }

  void reset() {
    state = state.copywith(
      isLoading: false,
      error: null,
      showMessage: false,
    );
  }

  void resetMessage() {
    state = state.copywith(
      showMessage: false,
      error: null,
      isLoading: false,
    );
  }
}
