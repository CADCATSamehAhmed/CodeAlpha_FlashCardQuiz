import 'package:flash_card_quiz/core/shared_widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AcceptButton extends StatelessWidget {
  final VoidCallback onPressed;
  const AcceptButton({super.key,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text: 'Accept Flash Card',
      onPressed: onPressed,
      width: 320.w,
      height: 50.h,
      isPrime: true,
    );
  }
}
