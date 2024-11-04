import 'package:animate_do/animate_do.dart';
import 'package:flash_card_quiz/core/constants/images.dart';
import 'package:flash_card_quiz/core/shared_widgets/default_appbar.dart';
import 'package:flash_card_quiz/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResultBody extends StatefulWidget {
  final int score;
  const ResultBody({super.key, required this.score});

  @override
  State<ResultBody> createState() => _ResultBodyState();
}

class _ResultBodyState extends State<ResultBody> {
  double opacity1=1;
  double opacity2=0;
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2)).then((value){
      setState(() {
        opacity1=0;
        opacity2=1;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppbar(title: "Score"),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Opacity(
              opacity: opacity2,
              child: Text(
                "You Got ${widget.score} points",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.secondary,
                  fontSize: 30.sp,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            Opacity(
              opacity: opacity1,
              child: ZoomIn(
                duration: const Duration(milliseconds: 1500),
                child: Image(image: AssetImage(Images.certificate),
                  fit: BoxFit.cover,
                    height: 300.w,
                    width: 300.w
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
