import 'package:assignment/src/core/constants/app_themes.dart';
import 'package:assignment/src/core/routes/names.dart';
import 'package:assignment/src/core/routes/router.dart';
import 'package:flutter/material.dart';

class AssignmentApp extends StatelessWidget {
  const AssignmentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppThemes.defaultTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: RoutesName.initial,
      onGenerateRoute: AppRoute.generate,
    );
  }
}

class AppBarThemes {}
