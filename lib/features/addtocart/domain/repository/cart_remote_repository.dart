import 'package:dartz/dartz.dart';
import 'package:final_project/core/failure/failure.dart';
import 'package:final_project/features/addtocart/data/repository/cart_repository.dart';
import 'package:final_project/features/addtocart/domain/entity/cart_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cartRepositoryProvider = Provider<ICartRepository>(
  (ref) => ref.read(cartRemoteRepositoryProvider),
);

abstract class ICartRepository {
  Future<Either<Failure, bool>> addToCart(CartEntity user);
  Future<Either<Failure, List<CartEntity>>> getCart(int page);
  Future<Either<Failure, bool>> removeFromCart(CartEntity cartEntity);
}
