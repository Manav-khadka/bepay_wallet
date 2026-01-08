import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      primaryColor: AppColors.primaryBlack,
      scaffoldBackgroundColor: AppColors.bgPureWhite,
      
      // Card Theme
      cardTheme: CardThemeData(
        color: AppColors.cardWidgetBg,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      
      // Color Scheme
      colorScheme: ColorScheme.light(
        primary: AppColors.primaryBlack,
        surface: AppColors.bgPureWhite,
        onPrimary: AppColors.bgPureWhite,
        onSurface: AppColors.primaryBlack,
      ),
      
      // Text Theme with Montserrat
      textTheme: GoogleFonts.montserratTextTheme(
        ThemeData.light().textTheme,
      ).apply(
        bodyColor: AppColors.primaryBlack,
        displayColor: AppColors.primaryBlack,
      ),
      
      // AppBar Theme
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.bgPureWhite,
        foregroundColor: AppColors.primaryBlack,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: GoogleFonts.montserrat(
          color: AppColors.primaryBlack,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
      
      // Button Themes
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryBlack,
          foregroundColor: AppColors.bgPureWhite,
          textStyle: GoogleFonts.montserrat(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        ),
      ),
      
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.primaryBlack,
          textStyle: GoogleFonts.montserrat(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      
      // Input Decoration Theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.cardWidgetBg,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: AppColors.primaryBlack,
            width: 1.5,
          ),
        ),
        labelStyle: GoogleFonts.montserrat(
          color: AppColors.blackWithOpacity,
        ),
        hintStyle: GoogleFonts.montserrat(
          color: AppColors.blackWithOpacity,
        ),
      ),
    );
  }
  
  // Prevent instantiation
  AppTheme._();
}
