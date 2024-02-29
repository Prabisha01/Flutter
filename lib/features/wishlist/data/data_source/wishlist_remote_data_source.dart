import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:final_project/config/constants/api_endpoints.dart';
import 'package:final_project/core/failure/failure.dart';
import 'package:final_project/core/network/remote/http_service.dart';
import 'package:final_project/core/shares_prefs/user_shared_prefs.dart';
import 'package:final_project/features/wishlist/data/dto/get_wishlist_dto.dart';
import 'package:final_project/features/wishlist/data/model/wishlist_api_model.dart';
import 'package:final_project/features/wishlist/data/model/wishlists_api_model.dart';
import 'package:final_project/features/wishlist/domain/entity/wishlist_entity.dart';
import 'package:final_project/features/wishlist/domain/entity/wishlists_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final wishlistRemoteDataSourceProvider = Provider<WishlistRemoteDataSource>(
  (ref) => WishlistRemoteDataSource(
      ref.read(httpServiceProvider), ref.read(userSharedPrefsProvider)),
);

class WishlistRemoteDataSource {
  final Dio dio;
  final UserSharedPrefs userSharedPrefs;

  WishlistRemoteDataSource(this.dio, this.userSharedPrefs);

  Future<Either<Failure, String>> addToWishlist(WishlistEntity wishlist) async {
    try {
      String? token;
      final data = await userSharedPrefs.getUserToken();
      data.fold((l) => token = null, (r) => token = r!);

      WishlistAPIModel wishlistAPIModel = WishlistAPIModel.fromEntity(wishlist);
      var response = await dio.post(ApiEndpoints.addToWishlist,
          data: wishlistAPIModel.toJson(),
          options: Options(headers: {'Authorization': 'Bearer $token'}));
 if (response.statusCode == 200) {
      String message = response.data['message'];
      return Right(message);
    } else {
      return Left(
        Failure(
          error: response.data['message'],
          statusCode: response.statusCode.toString(),
        ),
      );
    }
  } on DioException catch (e) {

    return Left(
      Failure(
        error: e.error.toString(),
        statusCode: e.response?.statusCode.toString() ?? '0',
      ),
    );
  }
}

  Future<Either<Failure, List<WishlistsEntity>>> getWishlist(int page) async {
    try {
      final userData = await userSharedPrefs.getUser();
      if (userData == null || userData['_id'] == null) {
        return Left(Failure(error: 'User data or user ID is null'));
      }

      String id = userData['_id'].toString();
      final url = 'wishlist/get_wishlists/$id';
      final response = await dio.get(url, queryParameters: {
        '_page': page,
        '_limit': ApiEndpoints.limitPage,
      });

      if (response.statusCode == 200) {
        GetWishlistDTO getWishlistDTO = GetWishlistDTO.fromJson(response.data);
        List<WishlistsEntity> wishlistList = getWishlistDTO.wishlists
            .map((data) => WishlistsAPIModel.toEntity(data))
            .toList();

        return Right(wishlistList);
      } else {
        return Left(Failure(
          error: response.statusMessage?.toString() ?? 'Unknown Error',
          statusCode: response.statusCode.toString(),
        ));
      }
    } on DioException catch (e) {
      print("Error: $e");
      return Left(Failure(error: e.message.toString()));
    }
  }

  Future<Either<Failure, String>> deleteWishlist(
      WishlistEntity wishlistEntity) async {
    try {
      final userTokenEither = await UserSharedPrefs().getUserToken();
      if (userTokenEither.isLeft()) {
        // Handle the failure to get the user token
        return left(userTokenEither.fold(
            (failure) => failure, (_) => Failure(error: '')));
      }

      final userToken = userTokenEither.getOrElse(() => null);

      final response = await dio.delete(
          ApiEndpoints.deleteWishlist + wishlistEntity.wishlistId!,
          options: Options(headers: {'Authorization': 'Bearer $userToken'}));

      if (response.statusCode == 200) {
      String message = response.data['message'];
      return Right(message);
    } else {
      return Left(
        Failure(
          error: response.data['message'],
          statusCode: response.statusCode.toString(),
        ),
      );
    }
  } on DioError catch (e) {
    print("Failed $e");
    return Left(
      Failure(
        error: e.error.toString(),
        statusCode: e.response?.statusCode.toString() ?? '0',
      ),
    );
  }
}
}