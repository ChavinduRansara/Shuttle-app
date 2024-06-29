import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shuttle_app/features/authentication/screens/onbording.dart';
import 'package:shuttle_app/utils/theme/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: const OnboardingScreen(), 
    );
  }
}