import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:final_project/config/constants/api_endpoints.dart';
import 'package:final_project/core/failure/failure.dart';
import 'package:final_project/core/network/remote/http_service.dart';
import 'package:final_project/core/shares_prefs/user_shared_prefs.dart';

import 'package:final_project/features/product/data/dto/get_all_nursy_dto.dart';
import 'package:final_project/features/product/domain/entity/nursy_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final nursyRemoteDataSourceProvider = Provider(
  (ref) => NursyRemoteDataSource(
    dio: ref.read(httpServiceProvider),
    userSharedPrefs: ref.read(userSharedPrefsProvider),
  ),
);

class NursyRemoteDataSource {
  final Dio dio;
  final UserSharedPrefs userSharedPrefs;

  NursyRemoteDataSource({
    required this.dio,
    required this.userSharedPrefs,
  });

  Future<Either<Failure, List<NursyEntity>>> getAllProducts() async {
    try {
      var response = await dio.get(ApiEndpoints.getAllProducts);
      if (response.statusCode == 200) {
        GetAllNursyDTO nursyAddDTO = GetAllNursyDTO.fromJson(response.data);
        List<NursyEntity> productList = nursyAddDTO.products
            .map((product) => product.toEntity(product))
            .toList();
        return Right(productList);
      } else {
        return Left(
          Failure(
            error: response.statusMessage.toString(),
            statusCode: response.statusCode.toString(),
          ),
        );
      }
    } on DioException catch (e) {
      return Left(
        Failure(
          error: e.error.toString(),
        ),
      );
    }
  }

  Future<Either<Failure, List<NursyEntity>>> searchProducts(String key) async {
    try {
      var response = await dio.get(ApiEndpoints.searchProduct, queryParameters: {'key': key});
      if (response.statusCode == 200) {
        GetAllNursyDTO nursyAddDTO = GetAllNursyDTO.fromJson(response.data);
        List<NursyEntity> productList = nursyAddDTO.products
            .map((product) => product.toEntity(product))
            .toList();
        return Right(productList);
      } else {
        return Left(
          Failure(
            error: response.statusMessage.toString(),
            statusCode: response.statusCode.toString(),
          ),
        );
      }
    } on DioException catch (e) {
      print('Hi: $e');
      return Left(
        Failure(
          error: e.error.toString(),
        ),
      );
    }
  }
}
