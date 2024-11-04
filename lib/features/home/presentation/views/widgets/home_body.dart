import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_card_quiz/core/themes/app_colors.dart';
import 'package:flash_card_quiz/features/home/presentation/view_model/home_cubit.dart';
import 'package:flash_card_quiz/features/home/presentation/views/widgets/flash_card_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    HomeCubit homeCubit = HomeCubit.get(context);
    return ListView(
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.mainColor,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(75.r),
            ),
          ),
          child: ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 50.h),
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
        ),
        Container(
          color: AppColors.mainColor,
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(100.r),
              ),
            ),
            child: GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
              children: [
                FlashCardCategory(
                  iconData: Icons.functions_sharp,
                  label: 'Mathematics',
                  flashCardsList: homeCubit.mathList,
                ),
                FlashCardCategory(
                  iconData: Icons.science,
                  label: 'Science',
                  flashCardsList: homeCubit.scienceList,
                ),
                FlashCardCategory(
                  iconData: Icons.temple_hindu_sharp,
                  label: 'history',
                  flashCardsList: homeCubit.historyList,
                ),
                FlashCardCategory(
                  iconData: Icons.translate_outlined,
                  label: 'language',
                  flashCardsList: homeCubit.languageList,
                ),
                FlashCardCategory(
                  iconData: Icons.business_center_sharp,
                  label: 'Business',
                  flashCardsList: homeCubit.businessList,
                ),
                FlashCardCategory(
                  iconData: Icons.computer,
                  label: 'Computer',
                  flashCardsList: homeCubit.computerList,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
