import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/theme/app_theme.dart';
import 'package:news/feature/home/screen/home_screen.dart';
import 'package:provider/provider.dart';

import 'core/providers/theme_provider.dart';
import 'core/utils/app_routes.dart';
import 'feature/splash/splash_screen.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider =Provider.of<ThemeProvider>(context);

    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'News',
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: themeProvider.themeMode,
          initialRoute: AppRoutes.splashScreen,
          routes: {
            AppRoutes.splashScreen: (context) => const SplashScreen(),
            AppRoutes.homeScreen: (context) => HomeScreen(),
          },
        );
      },
    );
  }
}
