import 'package:dartz/dartz.dart';
import 'package:final_project/core/failure/failure.dart';
import 'package:final_project/features/wishlist/domain/entity/wishlist_entity.dart';
import 'package:final_project/features/wishlist/domain/entity/wishlists_entity.dart';
import 'package:final_project/features/wishlist/domain/repository/wishlist_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getWishlistUseCaseProvider = Provider.autoDispose<GetWishlistUseCase>(
  (ref) =>
      GetWishlistUseCase(repository: ref.read(wishlistRepositoryProvider)),
);
 
class GetWishlistUseCase {
  final IWishlistRepository repository;
  GetWishlistUseCase({required this.repository});
 
  Future<Either<Failure, List<WishlistsEntity>>> getWishlist(int page) async {
    return await repository.getWishlist(page);
  }
}