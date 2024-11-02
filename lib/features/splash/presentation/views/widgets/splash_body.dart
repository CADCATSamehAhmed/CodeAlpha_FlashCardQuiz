import 'package:flash_card_quiz/core/constants/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:animate_do/animate_do.dart';

class SplashBody extends StatelessWidget {
  const SplashBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BounceInDown(
          duration: const Duration(seconds: 2),
          from: 150,
          child: Center(
            child: Image(
              image: AssetImage(Images.logo),
              width: 250.w,
              fit: BoxFit.cover,
              filterQuality: FilterQuality.high,
            ),
          ),
        ),
      ],
    );
  }
}
