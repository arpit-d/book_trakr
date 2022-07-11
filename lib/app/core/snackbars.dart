import 'package:book_tracker/app/core/app_colors.dart';
import 'package:book_tracker/app/core/app_theme.dart';
import 'package:flutter/material.dart';

enum SnackbarType {
  success,
  error,
  warning,
}

showSnackbar(
  context, {
  required String message,
  required SnackbarType snackbarType,
}) {
  return ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: TextStyle(
            fontSize: 16,
            fontFamily: AppTheme.fontFamily,
          ),
        ),
        behavior: SnackBarBehavior.floating,
        backgroundColor: determineSnackbarColor(snackbarType),
      ),
    );
}

determineSnackbarColor(SnackbarType snackbarType) {
  late Color color;
  switch (snackbarType) {
    case SnackbarType.success:
      color = AppColors.primaryColor;
      break;
    case SnackbarType.error:
      color = AppColors.redErrorColor;
      break;
    case SnackbarType.warning:
      color = AppColors.darkGreyColor;
      break;
  }
  return color;
}
