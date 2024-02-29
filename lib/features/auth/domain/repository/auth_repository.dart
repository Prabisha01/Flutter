import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:final_project/core/failure/failure.dart';
import 'package:final_project/features/auth/data/repository/auth_remote_repository.dart';
import 'package:final_project/features/auth/domain/entity/auth_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authRepositoryProvider = Provider<IAuthRepository>(
  (ref) => ref.read(authRemoteRepositoryProvider),
);

abstract class IAuthRepository {
  Future<Either<Failure, String>> register(AuthEntity user , File image);
  Future<Either<Failure, String>> loginUser(String email, String password);
    Future<Either<Failure, String>> forgetPassword(String email);
  Future<Either<Failure, String>> uploadProfilePicture(File file);
  Future<Either<Failure, String>> changePassword(String password, String newPassword, String confirmPassword);
  Future<Either<Failure, String>> changeProfile(String firstName, String lastName, String email, File image);
}
