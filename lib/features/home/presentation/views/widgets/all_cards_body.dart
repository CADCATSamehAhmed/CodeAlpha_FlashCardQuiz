import 'package:flash_card_quiz/core/constants/images.dart';
import 'package:flash_card_quiz/core/themes/app_colors.dart';
import 'package:flash_card_quiz/features/home/presentation/view_model/home_cubit.dart';
import 'package:flash_card_quiz/features/home/presentation/views/widgets/card_widget.dart';
import 'package:flash_card_quiz/features/quiz/data/models/flash_card_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllCardsBody extends StatelessWidget {
  const AllCardsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        HomeCubit homeCubit = HomeCubit.get(context);
        List<FlashCardModel> allFlashCards = [
          ...homeCubit.scienceList,
          ...homeCubit.mathList,
          ...homeCubit.historyList,
          ...homeCubit.languageList,
          ...homeCubit.computerList,
          ...homeCubit.businessList,
        ];
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
            ),
            Container(
              color: AppColors.mainColor,
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 50.h),
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(100.r),
                  ),
                ),
                child: (allFlashCards.isNotEmpty)
                    ? ListView.builder(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemCount: allFlashCards.length,
                        itemBuilder: (context, index) =>
                            CardWidget(flashCard: allFlashCards[index]))
                    : Column(
                        children: [
                          Image(
                              image: AssetImage(Images.sorry),
                              fit: BoxFit.cover,
                              height: 250.w,
                              width: 250.w),
                          Text(
                            "There is no Flash Card yet!",
                            style: TextStyle(
                                color: AppColors.secondary, fontSize: 25.sp),
                          ),
                        ],
                      ),
              ),
            ),
          ],
        );
      },
    );
  }
}
