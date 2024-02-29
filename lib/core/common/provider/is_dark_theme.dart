import 'package:final_project/core/shares_prefs/app_theme_pref.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final isDarkThemeProvider = StateNotifierProvider<IsDarkTheme, bool>(
  (ref) => IsDarkTheme(
    ref.watch(appThemePrefsProvider),
  ),
);

class IsDarkTheme extends StateNotifier<bool> {
  final AppThemePrefs appThemePrefs;

  // initially it will be light theme
  IsDarkTheme(this.appThemePrefs) : super(false) {
    onInit();
  }

  onInit() async {
    final isDarkTheme = await appThemePrefs.getTheme();
    isDarkTheme.fold((l) => state = false, (r) => state = r);
  }

  updateTheme(bool isDarkTheme) {
    appThemePrefs.setTheme(isDarkTheme);
    state = isDarkTheme;
  }
}
