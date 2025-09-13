import 'package:hackathon/src/design/theme/app_palette.dart';
import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Color? color;

  const CustomBackButton({super.key, this.onPressed, this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(color: Colors.transparent),
        child: Icon(
          Icons.arrow_back_ios,
          color: color ?? AppPalette.white,
          size: 20,
        ),
      ),
    );
  }
}
