
import 'package:dartz/dartz.dart';
import 'package:final_project/core/failure/failure.dart';
import 'package:final_project/features/auth/domain/repository/auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final forgetUseCaseProvider = Provider.autoDispose<ForgetUseCase>(
  (ref) => ForgetUseCase(ref.watch(authRepositoryProvider)),
);

class ForgetUseCase {
  final IAuthRepository _authRepository;

  ForgetUseCase(this._authRepository);

  Future<Either<Failure, String>> forgetPassword(
    String email,
    
  ) async {
    return await _authRepository.forgetPassword(email);
  }
}
