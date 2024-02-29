import 'package:dartz/dartz.dart';
import 'package:final_project/core/failure/failure.dart';
import 'package:final_project/features/wishlist/data/repository/wishlist_remote_repository.dart';
import 'package:final_project/features/wishlist/domain/entity/wishlist_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final wishlistRepositoryProvider = Provider<IWishlistRepository>(
  (ref) => ref.read(wishlistRemoteRepositoryProvider),
);


abstract class IWishlistRepository{
   Future<Either<Failure, String>> addToWishlist(WishlistEntity user);
    Future<Either<Failure, List<WishlistEntity>>> getWishlist(int page);
  Future<Either<Failure,String>>deleteWishlist(WishlistEntity wishlistEntity);
}

