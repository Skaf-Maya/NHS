import 'package:flutter/material.dart';
import 'package:nhs/theme/light_theme.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final double height;
  final double width;
  final TextStyle textStyle;
  final double radius;

  CustomButton({
    required this.onPressed,
    required this.text,
    required this.width,
    required this.height,
    required this.textStyle,
    required this.radius,
});

  @override
  Widget build(BuildContext context) {
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      backgroundColor: light().primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
    );

    return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius)
        ),
        child: TextButton(
          onPressed: onPressed,
          style: flatButtonStyle,
          child: Center(
            child: Text(text,
                textAlign: TextAlign.center,
                style: textStyle
            ),
          )
        ));
  }
}
