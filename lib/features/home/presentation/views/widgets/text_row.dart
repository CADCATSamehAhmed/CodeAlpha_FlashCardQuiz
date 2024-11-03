import 'package:flash_card_quiz/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextRow extends StatelessWidget {
  const TextRow({super.key,});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.h),
      child: Row(
        children: [
          Text(
            'FlashCard Categories',
            textAlign: TextAlign.start,
            style: TextStyle(color: AppColors.secondary,fontSize: 18),
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: () async{},
            style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.mainColor,
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(15.r))),
            child: Center(
              child: Text(
                'View All',
                style: TextStyle(
                  color:Colors.white,
                  fontSize:14.sp,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
