import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({super.key, this.height, this.width, this.color, required this.child, required this.onPressed, this.borderRadius});

  final double? height;
  final double? width;
  final Color? color;
  final Widget child;
  final VoidCallback onPressed;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 48,
      width: width ?? 327,
      decoration: BoxDecoration(
        color: color ?? Colors.white,
        borderRadius: BorderRadius.circular(borderRadius ?? 20),
      ),
      child: TextButton(
          onPressed: onPressed,
          child: child,
      ),
    );
  }
}
