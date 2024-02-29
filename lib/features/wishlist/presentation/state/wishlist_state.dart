import 'package:final_project/features/wishlist/domain/entity/wishlist_entity.dart';

class WishlistState {
  final bool isLoading;
  final String? error;
  final List<WishlistEntity> wishlists;
  final bool? showMessage;
  final int page;
  final bool hasReachedMax;
    final String? message;

  WishlistState(
      {required this.isLoading,
      this.error,
      required this.wishlists,
      this.showMessage,
      required this.page,
      required this.hasReachedMax,
       this.message
       });

  factory WishlistState.initialState() => WishlistState(
      isLoading: false,
      error: null,
      showMessage: false,
      wishlists: [],
      hasReachedMax: false,
      page: 0,
     
      );

  WishlistState copywith(
      {bool? isLoading,
      String? error,
      List<WishlistEntity>? wishlists,
      bool? showMessage,
      bool? hasReachedMax,
      int? page,
       String? message
      }) {
    return WishlistState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      showMessage: showMessage ?? this.showMessage,
      wishlists: wishlists ?? this.wishlists,
      page: page ?? this.page,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
       message: message?? this.message
    );
  }
}
