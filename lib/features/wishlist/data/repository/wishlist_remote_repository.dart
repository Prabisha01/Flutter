
import 'package:dartz/dartz.dart';
import 'package:final_project/core/failure/failure.dart';
import 'package:final_project/features/wishlist/data/data_source/wishlist_remote_data_source.dart';
import 'package:final_project/features/wishlist/domain/entity/wishlist_entity.dart';
import 'package:final_project/features/wishlist/domain/repository/wishlist_repository.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final wishlistRemoteRepositoryProvider = Provider<IWishlistRepository>
(
  (ref) =>WishlistRemoteRepository(
    ref.read(wishlistRemoteDataSourceProvider)

  ),
);

class WishlistRemoteRepository implements IWishlistRepository{
  final WishlistRemoteDataSource _wishlistRemoteDataSource;

  WishlistRemoteRepository(this._wishlistRemoteDataSource);

  @override
  Future<Either<Failure, String>> addToWishlist(WishlistEntity user) async {
       final result= await _wishlistRemoteDataSource.addToWishlist(user);
    return result.fold((failure)=>Left(failure),(sucess)=> Right(sucess));
  }
  @override
  Future<Either<Failure, List<WishlistEntity>>> getWishlist(int page) {
    return _wishlistRemoteDataSource.getWishlist(page);
  }

  
  @override
  Future<Either<Failure, String>> deleteWishlist(WishlistEntity wishlistEntity) async {
  final result= await _wishlistRemoteDataSource.deleteWishlist(wishlistEntity);
    return result.fold((failure)=>Left(failure),(sucess)=> Right(sucess));
  }
}