import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:nhs/theme/light_theme.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final double height;
  final double width;
  final TextStyle textStyle;
  final double radius;
  final bool loading;

  CustomButton({
    required this.onPressed,
    required this.text,
    required this.width,
    required this.height,
    required this.textStyle,
    required this.radius,
    required this.loading
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
            child: loading ? SpinKitWave(
              color: Theme.of(context).colorScheme.onPrimary,
              size: 20,
            ) :
            Text(text,
                textAlign: TextAlign.center,
                style: textStyle
            ),
          )
        ));
  }
}
