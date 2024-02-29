import 'package:dartz/dartz.dart';
import 'package:final_project/core/failure/failure.dart';
import 'package:final_project/core/network/local/hive_service.dart';
import 'package:final_project/features/auth/data/model/auth_hive_model.dart';
import 'package:final_project/features/auth/domain/entity/auth_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authLocalDataSourceProvider = Provider<AuthLocalDataSource>(
  (ref) => AuthLocalDataSource(ref.watch(hiveServiceProvider)),
);

class AuthLocalDataSource {
  final HiveService _hiveService;

  AuthLocalDataSource(this._hiveService);

  Future<Either<Failure, bool>> register(AuthEntity entity, AuthEntity user) async {
    try {
      // Convert auth entity to auth hive model
      AuthHiveModel authHiveModel = AuthHiveModel.toHiveModel(entity);
      // Save auth hive model to hive
      await _hiveService.registerUser(authHiveModel);
      return const Right(true);
    } catch (e) {
      return Left(Failure(error: e.toString()));
    }
  }

  Future<Either<Failure, bool>> loginUser(
    String email,
    String password,
  ) async {
    var isLogin = await _hiveService.loginUser(email, password);
    if (isLogin) {
      return const Right(true);
    } else {
      return Left(Failure(error: "Invalid username or password"));
    }
  }
}
