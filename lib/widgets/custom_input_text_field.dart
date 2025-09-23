import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:massaging_ui_design/widgets/custom_text.dart';

class CustomInputTextField extends StatelessWidget {
  const CustomInputTextField({
    super.key,
    this.suffixIcon,
    required this.hintText,
    required this.labelText,
    this.validationError,
    this.suffixTconButton,
    this.obscureTextValue,
    this.keyboardType,
    this.textEditingController,
    this.contentPadding,
  });

  final Icon? suffixIcon;
  final String hintText;
  final String labelText;
  final String? Function(String?)? validationError;
  final IconButton? suffixTconButton;
  final bool? obscureTextValue;
  final TextInputType? keyboardType;
  final TextEditingController? textEditingController;
  final EdgeInsetsGeometry? contentPadding;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      keyboardType: keyboardType ?? TextInputType.name,
      autofocus: false,
      obscureText: obscureTextValue ?? false,

      decoration: InputDecoration(
        border: UnderlineInputBorder(
          // borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(width: 2.w, color: Colors.red),
        ),
        hint: CustomText(text: hintText),
        label:CustomText(text: labelText) ,
        suffix: suffixTconButton,
        suffixIcon: suffixIcon,
        contentPadding: contentPadding ??EdgeInsets.symmetric(vertical: 15.r),
        disabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
        enabledBorder: UnderlineInputBorder(
          // borderRadius: BorderRadius.circular(20),

          borderSide: BorderSide(color: Colors.grey, width: 2.w),
        ),
        errorBorder: UnderlineInputBorder(
          // borderRadius: BorderRadius.circular(20.r),

          borderSide: BorderSide(color: Colors.red, width: 2.w),
        ),
        focusedBorder: UnderlineInputBorder(
          // borderRadius: BorderRadius.circular(20.r),

          borderSide: BorderSide(color: Colors.green, width: 2.w),
        ),
        focusedErrorBorder: UnderlineInputBorder(
          // borderRadius: BorderRadius.circular(20.r),

          borderSide: BorderSide(color: Colors.red, width: 2.w),
        ),
      ),
      validator: validationError,
    );
  }
}