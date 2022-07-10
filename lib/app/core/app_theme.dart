import 'package:book_tracker/app/core/app_colors.dart';
import 'package:flutter/material.dart';
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
          alignLabelWithHint: true,
          filled: true,
          fillColor: AppColors.lightGreyColor,
          labelStyle: TextStyle(color: AppColors.darkGreyColor),
          errorStyle: TextStyle(color: AppColors.redErrorColor),
          // focusColor: AppColors.greyLabelColor,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.lightGreyColor),
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.lightGreyColor),
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.lightGreyColor),
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.lightGreyColor),
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
        ),
        indicatorColor: AppColors.primaryColor,
        tabBarTheme: TabBarTheme(
          indicatorSize: TabBarIndicatorSize.label,
          labelStyle: TextStyle(
            color: AppColors.primaryColor,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.1,
            fontSize: 22,
            fontFamily: GoogleFonts.openSans().fontFamily,
          ),
          unselectedLabelStyle: TextStyle(
            color: Colors.grey,
            fontFamily: GoogleFonts.openSans().fontFamily,
          ),
        ),
        hintColor: AppColors.greyLabelColor,
        appBarTheme: const AppBarTheme(
          color: Colors.white,
          elevation: 0,
        ),
        iconTheme: const IconThemeData(
          color: AppColors.darkGreyColor,
        ),
        progressIndicatorTheme:
            const ProgressIndicatorThemeData(color: AppColors.primaryColor),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            elevation: MaterialStateProperty.all<double>(0),
            textStyle: MaterialStateProperty.all<TextStyle>(
              TextStyle(
                fontFamily: GoogleFonts.openSans().fontFamily,
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
