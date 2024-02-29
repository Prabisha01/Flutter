import 'package:final_project/features/wishlist/data/data_source/wishlist_remote_data_source.dart';
import 'package:final_project/features/wishlist/domain/entity/wishlist_entity.dart';
import 'package:final_project/features/wishlist/presentation/state/wishlist_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getWishlistViewModelProvider =
    StateNotifierProvider<GetWishlistViewModel, WishlistState>((ref) {
  final wishlistRemoteDataSource = ref.read(wishlistRemoteDataSourceProvider);
  return GetWishlistViewModel(wishlistRemoteDataSource);
});
 
class GetWishlistViewModel extends StateNotifier<WishlistState> {
  final WishlistRemoteDataSource wishlistRemoteDataSource;
 
  GetWishlistViewModel(this.wishlistRemoteDataSource)
      : super(WishlistState.initialState()) {
    getWishlist();
  }
 
 
  Future resetState() async {
    state = WishlistState.initialState();
    getWishlist();
  }
 
  Future<void> deleteWishlist(WishlistEntity wishlistId) async {
    try {
      await wishlistRemoteDataSource.deleteWishlist(wishlistId);
    } catch (error) {
      print(error.toString());
    }
  }
  Future getWishlist() async {
    state = state.copywith(isLoading: true);
 
    final currentState = state;
    final page = currentState.page + 1;
    final wishlists = currentState.wishlists;
    final hasReachedMax = currentState.hasReachedMax;
    if (!hasReachedMax) {
      // get data from data source
      final result = await wishlistRemoteDataSource.getWishlist(page);
      result.fold(
        (failure) =>
            state = state.copywith(hasReachedMax: true, isLoading: false),
        (data) {
          if (data.isEmpty) {
            state = state.copywith(hasReachedMax: true);
          } else {
            state = state.copywith(
              wishlists: [...wishlists, ...data],
              page: page,
              isLoading: false,
            );
          }
        },
      );
    }
  }
}