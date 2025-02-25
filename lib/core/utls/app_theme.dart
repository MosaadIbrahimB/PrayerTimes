import 'package:flutter/material.dart';
import 'package:prayer_times/core/utls/app_style.dart';

abstract class AppTheme {
  static ThemeData themeData(BuildContext context) {
    return ThemeData(
      textTheme: TextTheme(
        bodyLarge: AppStyle.textStyle20NotoKufia(context),
        bodyMedium: AppStyle.textStyle18NotoKufia(context),
        bodySmall: AppStyle.textStyle14NotoKufia(context),
      ),
    );
  }
}
