import 'dart:io';

import 'package:dio/dio.dart';
import 'package:final_project/config/router/app_routes.dart';
import 'package:final_project/core/common/snackbar/my_snackbar.dart';
import 'package:final_project/core/failure/failure.dart';
import 'package:final_project/core/shares_prefs/user_shared_prefs.dart';
import 'package:final_project/features/auth/domain/use_case/forget_usecase.dart';
import 'package:final_project/features/auth/domain/use_case/login_usecase.dart';
import 'package:final_project/features/auth/domain/use_case/register_usecase.dart';
import 'package:final_project/features/auth/domain/use_case/updatePassword.dart';
import 'package:final_project/features/auth/domain/use_case/update_profile_usecase.dart';
import 'package:final_project/features/auth/domain/use_case/upload_image.dart';
import 'package:final_project/features/auth/presentation/state/auth_state.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entity/auth_entity.dart';

final authViewModelProvider = StateNotifierProvider<AuthViewModel, AuthState>(
  (ref) => AuthViewModel(
    ref.read(registerUseCaseProvider),
    ref.read(loginUseCaseProvider),
    ref.read(uploadImageUseCaseProvider),
    ref.read(userSharedPrefsProvider),
    ref.read(updatePasswordUseCaseProvider),
    ref.read(updateProfileUseCaseProvider),
    ref.read(forgetUseCaseProvider),
  ),
);

class AuthViewModel extends StateNotifier<AuthState> {
  final RegisterUseCase _registerUseCase;
  final LoginUseCase _loginUseCase;
  final UploadImageUseCase _uploadImageUsecase;
  final UserSharedPrefs _userSharedPrefs;
  final UpdatePasswordUseCase _passwordUseCase;
  final UpdateProfileUseCase _updateProfileUsecase;
  final ForgetUseCase _forgotPasswordUseCase;

  AuthViewModel(
      this._registerUseCase,
      this._loginUseCase,
      this._uploadImageUsecase,
      this._userSharedPrefs,
      this._passwordUseCase,
      this._updateProfileUsecase,
      this._forgotPasswordUseCase)
      : super(AuthState.initial());

  Future<void> uploadImage(File? file) async {
    state = state.copyWith(isLoading: true);
    var data = await _uploadImageUsecase.uploadProfilePicture(file!);
    data.fold(
      (l) {
        state = state.copyWith(isLoading: false, error: l.error);
      },
      (imageName) {
        state = state.copyWith(
          isLoading: false,
          error: null,
          imageName: imageName,
        );
      },
    );
  }

 Future<void> register(
  BuildContext context, AuthEntity user, File image) async {
  try {
    state = state.copyWith(isLoading: true);

    var result = await _registerUseCase.register(user, image);

    state = state.copyWith(isLoading: false);

    result.fold(
      (failure) {
        handleFailure(context, failure);
      },
      (success) {
        handleSuccess(context, "Successfully registered");
        Navigator.popAndPushNamed(context, AppRoute.loginRoute);
      },
    );
  } catch (e) {
    // If it's a DioError, extract the error message
    if (e is DioError && e.response != null) {
      String backendErrorMessage = e.response!.data['error'] ?? 'Unknown error';
      handleFailure(
        context,
        Failure(
          error: backendErrorMessage,
          statusCode: e.response!.statusCode.toString(),
        ),
      );
    } else {
      // If it's not a DioError, handle it with a generic error message
      handleFailure(
        context,
        Failure(error: 'Error registering user', statusCode: '500'),
      );
    }
  }
}

  Future<void> loginUser(
      BuildContext context, String email, String password) async {
    try {
      state = state.copyWith(isLoading: true);

      var result = await _loginUseCase.loginUser(email, password);

      state = state.copyWith(isLoading: false);

      result.fold(
        (failure) {
          handleFailure(context, failure);
        },
        (success) {
          handleSuccess(context, "Successfully logged in");
          Navigator.popAndPushNamed(context, AppRoute.dashboardRoute);
        },
      );
    } catch (e) {
      handleFailure(
        context,
        Failure(error: 'Error logging in', statusCode: '500'),
      );
    }
  }

  Future<void> forgetPassword(BuildContext context, String email) async {
    try {
      state = state.copyWith(isLoading: true);

      var result = await _forgotPasswordUseCase.forgetPassword(email);

      result.fold(
        (failure) {
          state = state.copyWith(
            error: failure.error,
            isLoading: false,
            showMessage: true,
          );
          showSnackBar(
            message: state.error!,
            context: context,
            color: Colors.red[900],
          );
        },
        (success) {
          state = state.copyWith(
            isLoading: false,
            message: success,
            showMessage: true,
            error: null,
          );
          showSnackBar(
            message: state.message!,
            context: context,
          );
          Navigator.popAndPushNamed(context, AppRoute.dashboardRoute);
        },
      );
    } catch (e) {
      state = state.copyWith(
        error: 'Error sending mail',
        isLoading: false,
        showMessage: true,
      );
    }
  }

  void handleSuccess(BuildContext context, String message) {
    state = state.copyWith(isLoading: false, error: null);
    showSnackBar(message: message, context: context);
    // Add any additional navigation logic if needed
  }

  void handleFailure(BuildContext context, Failure failure) {
    state = state.copyWith(
      isLoading: false,
      error: failure.error,
    );
    showSnackBar(message: failure.error, context: context, color: Colors.red);
  }

  void logout(BuildContext context) async {
    state = state.copyWith(isLoading: true);
    showSnackBar(
      message: 'Logged Out',
      context: context,
    );

    await _userSharedPrefs.deleteUserToken();
    Future.delayed(const Duration(milliseconds: 1000), () {
      state = state.copyWith(isLoading: true);
      Navigator.pushNamedAndRemoveUntil(
        context,
        AppRoute.loginRoute,
        (route) => false,
      );
    });
  }

  //Login

  Future<void> updateUserPassword(String currentPassword, String newPassword,
      String confirmPassword, BuildContext context) async {
    try {
      state = state.copyWith(isLoading: true);
      final result = await _passwordUseCase.updateUserPassword(
          currentPassword, newPassword, confirmPassword);
      state = state.copyWith(isLoading: false);
      result.fold(
        (failure) {
          state = state.copyWith(
            error: failure.error,
            isLoading: false,
            showMessage: true,
          );
          showSnackBar(
            message: state.error!,
            context: context,
            color: Colors.red[900],
          );
        },
        (success) {
          state = state.copyWith(
            isLoading: false,
            message: success,
            showMessage: true,
            error: null,
          );
          showSnackBar(
            message: state.message!,
            context: context,
          );
          Navigator.popAndPushNamed(context, AppRoute.dashboardRoute);
        },
      );
    } catch (e) {
      state = state.copyWith(
        error: 'Error updating password',
        isLoading: false,
        showMessage: true,
      );
    }
  }

  Future<void> updateUserProfile(String firstName, String lastName,
      String email, File image, BuildContext context) async {
    try {
      state = state.copyWith(isLoading: true);
      final result = await _updateProfileUsecase.updateProfile(
          firstName, lastName, email, image);
      state = state.copyWith(isLoading: false);
      result.fold(
        (failure) {
          state = state.copyWith(
            error: failure.error,
            isLoading: false,
            showMessage: true,
          );
          showSnackBar(
            message: state.error!,
            context: context,
            color: Colors.red[900],
          );
        },
        (success) {
          state = state.copyWith(
            isLoading: false,
            message: success,
            showMessage: true,
            error: null,
          );
          showSnackBar(
            message: state.message!,
            context: context,
          );
          Navigator.popAndPushNamed(context, AppRoute.dashboardRoute);
        },
      );
    } catch (e) {
      state = state.copyWith(
        error: 'Error updating password',
        isLoading: false,
        showMessage: true,
      );
    }
  }
}
