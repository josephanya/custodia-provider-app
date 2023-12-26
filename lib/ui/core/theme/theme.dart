import 'package:custodia_provider/ui/core/constants/colors.dart';
import 'package:custodia_provider/ui/core/constants/fonts.dart';
import 'package:custodia_provider/ui/core/theme/swatch.dart';
import 'package:flutter/material.dart';

themeData(context) => ThemeData(
      fontFamily: Fonts.kPrimary,
      primaryColor: AppColors.blue,
      scaffoldBackgroundColor: AppColors.white,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      textSelectionTheme: const TextSelectionThemeData(
        selectionColor: AppColors.hilighted,
        cursorColor: AppColors.blue,
        selectionHandleColor: AppColors.blue,
      ),
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: createMaterialColor(
          AppColors.white,
        ),
      ).copyWith(
        secondary: AppColors.blue,
        background: AppColors.white,
      ),
    );
