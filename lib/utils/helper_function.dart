import 'package:flutter/material.dart';

Widget circuleBox({
  required Widget child,
  double height = 48,
  double width = 48,
  double borderWidth = 0.7,
  double borderRadius = 24,
  Color borderColor = Colors.white54,
  Color boxColor = Colors.white54
}) {
  return Container(
    height: height,
    width: width,
    decoration: BoxDecoration(
      color: boxColor,
      border: Border.all(width: borderWidth,
      color: borderColor),
      borderRadius: BorderRadius.circular(borderRadius),
    ),

    child: child,
  );
}
