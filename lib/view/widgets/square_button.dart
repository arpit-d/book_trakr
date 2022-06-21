import 'package:book_tracker/app/core/app_colors.dart';
import 'package:flutter/material.dart';

class SquareButton extends StatelessWidget {
  const SquareButton({
    Key? key,
    required this.title,
    required this.onPressed,
    required this.isDisabled,
  }) : super(key: key);

  final String title;
  final VoidCallback onPressed;
  final bool isDisabled;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: AppColors.primaryColor,
      ),
      onPressed: isDisabled ? onPressed : null,
      child: SizedBox(
        height: 48,
        width: double.infinity,
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
