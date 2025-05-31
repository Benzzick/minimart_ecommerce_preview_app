import 'package:flutter/material.dart';
import 'package:minimart_ecommerce_preview_app/core/app_styles/app_pallete.dart';

class AppTheme {
  static final ThemeData appTheme = ThemeData(
      colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: AppPalette.slate,
        onPrimary: AppPalette.offWhite,
        secondary: AppPalette.blue,
        onSecondary: AppPalette.offWhite,
        tertiary: AppPalette.green,
        onTertiary: AppPalette.offWhite,
        error: Color.fromRGBO(239, 68, 68, 1),
        onError: AppPalette.offWhite,
        surface: AppPalette.offWhite,
        onSurface: AppPalette.moreGrey,
        onSurfaceVariant: AppPalette.gray,
        outline: AppPalette.gray,
        shadow: AppPalette.black,
        inverseSurface: AppPalette.greyBlack,
        onInverseSurface: AppPalette.offWhite,
        inversePrimary: AppPalette.green,
      ),
      textTheme: TextTheme(
        labelMedium: TextStyle(
          fontFamily: 'IBMPlexMono',
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
        titleMedium: TextStyle(
          fontFamily: 'IBMPlexSans',
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
        titleLarge: TextStyle(
          fontFamily: 'IBMPlexSans',
          fontSize: 26,
          fontWeight: FontWeight.w500,
        ),
        bodySmall: TextStyle(
          fontFamily: 'IBMPlexSans',
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
        bodyMedium: TextStyle(
          fontFamily: 'IBMPlexSans',
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        bodyLarge: TextStyle(
          fontFamily: 'IBMPlexSans',
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        headlineSmall: TextStyle(
          fontFamily: 'SFProText',
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        headlineMedium: TextStyle(
          fontFamily: 'SFProText',
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ));
}
