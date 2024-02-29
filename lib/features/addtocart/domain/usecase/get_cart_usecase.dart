import 'package:dartz/dartz.dart';
import 'package:final_project/features/addtocart/domain/entity/cart_entity.dart';
import 'package:final_project/features/addtocart/domain/entity/carts_entity.dart';
import 'package:final_project/features/addtocart/domain/repository/cart_remote_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/failure/failure.dart';

final getCartUseCaseProvider = Provider.autoDispose<GetCartUseCase>(
  (ref) =>
      GetCartUseCase(repository: ref.read(cartRepositoryProvider)),
);
 
class GetCartUseCase {
  final ICartRepository repository;
  GetCartUseCase({required this.repository});
 
  Future<Either<Failure, List<CartsEntity>>> getCart(int page) async {
    return await repository.getCart(page);
  }
}