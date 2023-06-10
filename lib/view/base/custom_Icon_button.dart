import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final double iconSize;
  final Color iconColor;
  final double height;
  final double width;
  final double radius;
  final Color color;

  CustomIconButton({
    required this.onPressed,
    required this.icon,
    required this.iconSize,
    required this.iconColor,
    required this.width,
    required this.height,
    required this.radius,
    required this.color
});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: color,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.3),
                spreadRadius: 0,
                blurRadius: 2
            ),
          ],
        ),
        child: IconButton(
          onPressed: onPressed,
          icon: Icon(icon),
          iconSize: iconSize,
          color: iconColor,
        )
    );
  }
}
