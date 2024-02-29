import 'package:final_project/features/wishlist/domain/entity/wishlists_entity.dart';

class WishlistsState {
  final bool isLoading;
  final String? error;
 final List<WishlistsEntity> wishlists;
  final bool? showMessage;
  final int page;
  final bool hasReachedMax;
  final String? message;

  WishlistsState(
      {required this.isLoading,
      this.error,
      required this.wishlists,
      this.showMessage,
      required this.page,
      required this.hasReachedMax,
      this.message});

  factory WishlistsState.initialState() => WishlistsState(
        isLoading: false,
        error: null,
        showMessage: false,
        wishlists:[],
        hasReachedMax: false,
        page: 0,
      );

  WishlistsState copywith(
      {bool? isLoading,
      String? error,
      List<WishlistsEntity>? wishlists,
      bool? showMessage,
      bool? hasReachedMax,
      int? page,
      String? message}) {
    return WishlistsState(
        isLoading: isLoading ?? this.isLoading,
        error: error ?? this.error,
        showMessage: showMessage ?? this.showMessage,
        wishlists: wishlists ?? this.wishlists,
        page: page ?? this.page,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax,
        message: message ?? this.message);
  }
}
