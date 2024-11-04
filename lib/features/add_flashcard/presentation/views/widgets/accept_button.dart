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
      children: [
        CustomButton(
          text: 'Add More FlashCard',
          onPressed: addMoreFunction,
          height: 50.h,
          isPrime: false,
        ),
        const Spacer(),
        CustomButton(
          text: 'Accept Flash Card',
          onPressed: acceptFunction,
          height: 50.h,
          isPrime: true,
        ),
      ],
    );
  }
}
