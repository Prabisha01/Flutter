import 'package:dartz/dartz.dart';
import 'package:final_project/core/failure/failure.dart';
import 'package:final_project/features/addtocart/data/data_source/cart_data_source.dart';
import 'package:final_project/features/addtocart/domain/entity/cart_entity.dart';
import 'package:final_project/features/addtocart/domain/entity/carts_entity.dart';
import 'package:final_project/features/addtocart/domain/repository/cart_remote_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cartRemoteRepositoryProvider = Provider<ICartRepository>(
  (ref) => CartRemoteRepository(
    ref.read(cartRemoteDataSourceProvider),
  ),
);

class CartRemoteRepository implements ICartRepository {
  final CartRemoteDataSource _cartRemoteDataSource;

  CartRemoteRepository(this._cartRemoteDataSource);

  @override
  Future<Either<Failure, bool>> addToCart(CartEntity cart) async {
    return await _cartRemoteDataSource.addToCart(cart);
  }
  
  
  @override
  Future<Either<Failure, List<CartsEntity>>> getCart(int page) {
    return _cartRemoteDataSource.getCart(page);
  }
  
  @override
  Future<Either<Failure, bool>> removeFromCart(CartEntity cartEntity) {
     return _cartRemoteDataSource.removeFromCart(cartEntity);
  }
}