import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:final_project/core/failure/failure.dart';
import 'package:final_project/features/auth/domain/repository/auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final updateProfileUseCaseProvider = Provider.autoDispose<UpdateProfileUseCase>(
    (ref) =>
        UpdateProfileUseCase(repository: ref.read(authRepositoryProvider)));

class UpdateProfileUseCase {
  final IAuthRepository repository;

  UpdateProfileUseCase({required this.repository});
  Future<Either<Failure, String>> updateProfile(
      String firstName, String lastName, String email, File image) async {
    return await repository.changeProfile(firstName, lastName, email, image);
  }
}
