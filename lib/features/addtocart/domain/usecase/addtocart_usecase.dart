import 'package:dartz/dartz.dart';
import 'package:final_project/core/failure/failure.dart';
import 'package:final_project/features/addtocart/domain/repository/cart_remote_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../entity/cart_entity.dart';

final addToCartUseCaseProvider = Provider.autoDispose<AddToCartUseCase>(
  (ref) => AddToCartUseCase(ref.read(cartRepositoryProvider)),
);

class AddToCartUseCase {
  final ICartRepository _cartRepository;

  AddToCartUseCase(this._cartRepository);

  Future<Either<Failure, bool>> addToCart(CartEntity entity) async {
    return await _cartRepository.addToCart(entity);
  }
}
