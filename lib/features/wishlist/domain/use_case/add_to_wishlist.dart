
import 'package:dartz/dartz.dart';
import 'package:final_project/core/failure/failure.dart';
import 'package:final_project/features/wishlist/domain/entity/wishlist_entity.dart';
import 'package:final_project/features/wishlist/domain/repository/wishlist_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final addToWishlistUseCaseProvider = Provider.autoDispose<AddToWishlistUseCase>(
  (ref) => AddToWishlistUseCase(ref.read(wishlistRepositoryProvider))
);
class AddToWishlistUseCase{
  final IWishlistRepository _wishlistRepository;

  AddToWishlistUseCase( this._wishlistRepository);


  Future<Either<Failure, String>> addToWishlist(WishlistEntity entity) async{
    return await _wishlistRepository.addToWishlist(entity);

  }
  
}