import 'package:final_project/config/router/app_routes.dart';
import 'package:final_project/config/themes/theme.dart';
import 'package:final_project/core/common/provider/is_dark_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkTheme = ref.watch(isDarkThemeProvider);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Prabisha',
      initialRoute: AppRoute.splashRoute,
      theme: AppTheme.getApplicationTheme(isDarkTheme),
      routes: AppRoute.getApplicationRoute(),
    );
  }
}
