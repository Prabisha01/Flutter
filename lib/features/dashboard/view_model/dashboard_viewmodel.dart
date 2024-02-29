import 'package:final_project/config/router/app_routes.dart';
import 'package:final_project/core/common/snackbar/my_snackbar.dart';
import 'package:final_project/core/shares_prefs/user_shared_prefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final dashboardViewModelProvider = StateNotifierProvider<DashboardViewModel, bool>(
  (ref) => DashboardViewModel(
    ref.read(userSharedPrefsProvider),
  ),
);

class DashboardViewModel extends StateNotifier<bool> {
  final UserSharedPrefs _userSharedPrefs;
  DashboardViewModel(this._userSharedPrefs) : super(false);

  void logout(BuildContext context) async {
    state = true;
    showSnackBar(
        message: 'Logging out....', context: context, color: Colors.red);

    await _userSharedPrefs.deleteUserToken();
    Future.delayed(const Duration(milliseconds: 2000), () {
      state = false;
      Navigator.pushNamedAndRemoveUntil(
        context,
        AppRoute.loginRoute,
        (route) => false,
      );
    });
  }
}
