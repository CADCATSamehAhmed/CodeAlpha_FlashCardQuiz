import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_card_quiz/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget{
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.mainColor,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(30.r),
          bottomLeft: Radius.circular(30.r),
        ),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
        title: Text("Quiz Categories",style:TextStyle(color: Colors.white, fontSize: 25.sp),),
        subtitle: DefaultTextStyle(
          style: TextStyle(color: Colors.grey, fontSize: 18.sp),
          child: AnimatedTextKit(
            animatedTexts: [
              TyperAnimatedText("Challenge your knowledge",speed:const Duration(milliseconds: 150)),
              TyperAnimatedText("Make Amazing FlashCards",speed:const Duration(milliseconds: 150)),
              TyperAnimatedText("Have a nice Studying",speed:const Duration(milliseconds: 150)),
            ],
            repeatForever: true,
          ),
        ),
      ),
    );
  }
  @override
  Size get preferredSize => Size.fromHeight(140.h);
}

class AllCardsAppBar extends StatelessWidget implements PreferredSizeWidget{
  const AllCardsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.mainColor,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(30.r),
          bottomLeft: Radius.circular(30.r),
        ),
      ),
      child: ListTile(
        contentPadding:
        EdgeInsets.symmetric(horizontal: 20.w, vertical: 50.h),
        title: Text(
          'All Flash Cards',
          style: TextStyle(color: Colors.white, fontSize: 25.sp),
        ),
        subtitle: Text(
          '',
          style: TextStyle(fontSize: 16.sp),
        ),
      ),
    );
  }
  @override
  Size get preferredSize => Size.fromHeight(140.h);
}
