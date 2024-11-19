import 'package:flutter/material.dart';
import 'package:flutter_starter/core/theme/app_colors.dart';
import 'package:flutter_starter/core/theme/app_text_styles.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get theme {
    return ThemeData(
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.background,
      textTheme: TextTheme(
        headlineLarge: AppTextStyles.heading,
        bodyLarge: AppTextStyles.body,
        bodyMedium: AppTextStyles.error,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.primary,
        titleTextStyle: AppTextStyles.heading,
      ),
    );
  }
}
