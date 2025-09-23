import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.text,
    this.fontSize,
    this.fontStyle,
    this.fontWeight,
    this.textStyle,
    this.fontFamily,
    this.color, this.textOverflow

  });

  final String text;
  final double? fontSize;
  final Color? color ;
  final FontWeight? fontWeight;
  final TextStyle? textStyle;
  final FontStyle? fontStyle;
  final String? fontFamily;
  final TextOverflow? textOverflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:
          textStyle ??
          TextStyle(
              overflow: textOverflow,
            fontSize: fontSize ?? 16.sp,
            color: color ?? Colors.black38,
            fontWeight: fontWeight ?? FontWeight.normal,
            fontStyle: fontStyle ?? FontStyle.normal,
            fontFamily:fontFamily
          ),
    );
  }
}
