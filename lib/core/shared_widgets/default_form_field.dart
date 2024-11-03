import 'package:flash_card_quiz/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultFormField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType type;
  final String? Function(String?) validate;
  final VoidCallback? onTap;
  final VoidCallback? onEditingComplete;
  final bool? obscureText;
  final String? label;
  final String? hint;
  final bool? hasBorders;
  final bool? autofocus;
  final Color? filledColor;

  const DefaultFormField(
      {super.key,
      required this.controller,
      required this.type,
      required this.validate,
      this.label,
      this.hint,
      this.onTap,
      this.onEditingComplete,
      this.obscureText,
      this.hasBorders,
      this.autofocus,
      this.filledColor});

  @override
  Widget build(BuildContext context) {
    FocusNode focusNode = FocusNode();
    return TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: obscureText ?? false,
      cursorColor:filledColor !=null ?Colors.white:AppColors.mainColor,
      maxLines: 5,
      minLines: 1,
      textAlign: TextAlign.start,
      validator: validate,
      onEditingComplete: onEditingComplete,
      onTap: onTap,
      autofocus: autofocus ?? false,
      focusNode: focusNode,
      style: TextStyle(color: filledColor !=null ?Colors.white:AppColors.mainColor),
      decoration: InputDecoration(
        filled: true,
        fillColor: filledColor ?? Colors.transparent,
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white),
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white),
        border: hasBorders ?? true
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.r),
              )
            : null,
        enabledBorder: hasBorders ?? true
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.r),
                borderSide: BorderSide(
                  color: AppColors.mainColor,
                ),
              )
            : null,
        focusedBorder: hasBorders ?? true
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.r),
                borderSide: BorderSide(color: AppColors.mainColor, width: 1.5),
              )
            : null,
      ),
    );
  }
}
