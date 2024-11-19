import 'package:flutter/material.dart';
import 'package:flutter_starter/core/theme/app_colors.dart';
import 'package:flutter_starter/core/theme/app_dimensions.dart';

class AppTextStyles {
  AppTextStyles._();

  static TextStyle heading = const TextStyle(
    fontSize: AppDimensions.fontSizeLarge,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  static TextStyle body = const TextStyle(
    fontSize: AppDimensions.fontSizeMedium,
    color: AppColors.textSecondary,
  );

  static TextStyle error = const TextStyle(
    fontSize: AppDimensions.fontSizeMedium,
    color: AppColors.error,
  );
}
