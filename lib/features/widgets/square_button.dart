import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/gaps.dart';
import '../../core/styles/styles.dart';

enum ButtonType { icon, image, onlyText }

class SquareButton extends StatelessWidget {
  const SquareButton({
    Key? key,
    required this.title,
    required this.onPressed,
    required this.isDisabled,
    this.color = AppColors.primaryColor,
    this.buttonType = ButtonType.onlyText,
  }) : super(key: key);

  final String title;
  final VoidCallback onPressed;
  final bool isDisabled;
  final Color color;
  final ButtonType buttonType;
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
        child: buttonType == ButtonType.onlyText
            ? Center(
                child: titleText(),
              )
            : Row(
                children: [
                  if (buttonType == ButtonType.icon)
                    const Expanded(
                      child: Icon(signInIcon, color: Colors.white),
                    ),
                  if (buttonType == ButtonType.image)
                    Expanded(child: SvgPicture.asset('assets/Google_Logo.svg')),
                  gapW16,
                  Expanded(flex: 5, child: titleText()),
                ],
              ),
      ),
    );
  }

  Text titleText() {
    return Text(
      title,
      style: const TextStyle(
        color: Colors.white,
      ),
    );
  }
}
