import 'package:flash_card_quiz/core/constants/images.dart';
import 'package:flash_card_quiz/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10.w,60.h,10.w,75.h),
      decoration: BoxDecoration(
        color: AppColors.mainColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25.r),
          bottomRight: Radius.circular(25.r),
        ),
      ),
      child: Row(
        children: [
          Image(
            image: AssetImage(Images.logo),
            height: 50.h,
            fit: BoxFit.cover,
          ),
          SizedBox(width: 15.w),
          Text(
            'Welcome to QuiZy',
            style: TextStyle(color: Colors.white, fontSize: 25.sp),
          ),
        ],
      ),
    );
  }
}
