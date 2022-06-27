import 'package:book_tracker/app/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
        primarySwatch: AppColors.primarySwatch,
        backgroundColor: Colors.white,
        primaryColor: AppColors.primaryColor,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: GoogleFonts.openSans().fontFamily,
        // These are all related to [TextFormField]
        highlightColor: const Color(0xff936F3E),
        textSelectionTheme: const TextSelectionThemeData(
            cursorColor: AppColors.greyLabelColor,
            selectionColor: AppColors.greyLabelColor),
        focusColor: AppColors.greyLabelColor,
        inputDecorationTheme: const InputDecorationTheme(
          labelStyle: TextStyle(color: AppColors.greyLabelColor),
          errorStyle: TextStyle(color: AppColors.redErrorColor),
          focusColor: AppColors.greyLabelColor,
        ),
        indicatorColor: AppColors.primaryColor,
        tabBarTheme: const TabBarTheme(
          indicatorSize: TabBarIndicatorSize.label,
          labelStyle: TextStyle(
            color: AppColors.primaryColor,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.1,
            fontSize: 22,
          ),
          unselectedLabelStyle: TextStyle(color: Colors.grey),
        ),
        hintColor: AppColors.greyLabelColor,
        appBarTheme: const AppBarTheme(
          systemOverlayStyle:
              SystemUiOverlayStyle(statusBarColor: Colors.transparent),
        ),
        progressIndicatorTheme:
            const ProgressIndicatorThemeData(color: AppColors.primaryColor),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            elevation: MaterialStateProperty.all<double>(0),
            textStyle: MaterialStateProperty.all<TextStyle>(
              const TextStyle(
                color: Colors.white,
                // letterSpacing: 1.1,
                fontSize: 20,
                // fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        buttonTheme: ButtonThemeData(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(22.0)),
          buttonColor: AppColors.primaryColor,
        ));
  }
}
