import 'package:book_tracker/app/core/app_colors.dart';
import 'package:book_tracker/app/core/gaps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SquareButton extends StatelessWidget {
  const SquareButton(
      {Key? key,
      required this.title,
      required this.onPressed,
      required this.isDisabled,
      this.color = AppColors.primaryColor})
      : super(key: key);

  final String title;
  final VoidCallback onPressed;
  final bool isDisabled;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: color,
      ),
      onPressed: onPressed,
      child: SizedBox(
        height: 52,
        width: double.infinity,
        child: Row(
          children: [
            Expanded(
              child: SvgPicture.asset('assets/Google_Logo.svg'),
            ),
            gapW16,
            Expanded(
              flex: 5,
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
