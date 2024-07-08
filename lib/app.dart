import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shuttle_app/bindings/general_bindings.dart';
import 'package:shuttle_app/utils/constants/colors.dart';
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
      debugShowCheckedModeBanner: false,
      initialBinding: GeneralBindings(),
      home: const Scaffold(
        backgroundColor: AppColor.primaryColor,
        body: Center(
          child: CircularProgressIndicator(
            color: Colors.white,
          )
        ),
      )
    );
  }
}