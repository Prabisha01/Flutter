import 'package:final_project/config/router/app_routes.dart';
import 'package:final_project/core/shares_prefs/user_shared_prefs.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

final splashViewModelProvider = StateNotifierProvider<SplashViewModel, void>(
  (ref) {
    return SplashViewModel(
      ref.read(userSharedPrefsProvider),
    );
  },
);

class SplashViewModel extends StateNotifier<void> {
  final UserSharedPrefs _userSharedPrefs;
  SplashViewModel(this._userSharedPrefs) : super(null);

  init(BuildContext context) async {
    final data = await _userSharedPrefs.getUserToken();
    data.fold((l) => null, (token) {
      if (token != null) {
        bool isTokenExpired = isValidToken(token);
        if (isTokenExpired) {
          Navigator.popAndPushNamed(context, AppRoute.loginRoute);
        } else {
          Navigator.popAndPushNamed(context, AppRoute.dashboardRoute);
        }
      } else {
        Navigator.popAndPushNamed(context, AppRoute.loginRoute);
      }
    });
  }

  bool isValidToken(String token) {
    try {
      Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
      dynamic expirationTimestamp = decodedToken['exp'];
      if (expirationTimestamp == null || expirationTimestamp is! int) {
        return false;
      }

      final currentDate = DateTime.now().millisecondsSinceEpoch;
      return currentDate > (expirationTimestamp) * 1000;
    } catch (e) {
      return false;
    }
  }
}
