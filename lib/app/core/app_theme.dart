import 'package:book_tracker/app/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
        backgroundColor: Colors.white,
        primaryColor: AppColors.primaryColor,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: GoogleFonts.openSans().fontFamily,
        errorColor: AppColors.redErrorColor,
        appBarTheme: const AppBarTheme(
          systemOverlayStyle:
              SystemUiOverlayStyle(statusBarColor: Colors.transparent),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(AppColors.primaryColor)),
        ),
        buttonTheme: ButtonThemeData(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(22.0)),
          buttonColor: AppColors.primaryColor,
        ));
  }
}
