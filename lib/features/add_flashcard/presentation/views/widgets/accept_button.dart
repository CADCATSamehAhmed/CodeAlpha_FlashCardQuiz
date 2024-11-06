import 'package:flash_card_quiz/core/shared_widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AcceptButton extends StatelessWidget {
  final VoidCallback acceptFunction;
  final VoidCallback addMoreFunction;

  const AcceptButton({super.key, required this.acceptFunction, required this.addMoreFunction});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomButton(
          text: 'Add More ',
          onPressed: addMoreFunction,
          height: 40.h,
          isPrime: false,
        ),
        SizedBox(width: 20.w),
        CustomButton(
          text: 'Accept',
          onPressed: acceptFunction,
          height: 40.h,
          isPrime: true,
        ),
      ],
    );
  }
}
