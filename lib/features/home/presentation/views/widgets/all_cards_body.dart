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
          ...homeCubit.otherList,
        ];
        if (state is GetDataLoadingState) {
          return Center(
              child: CircularProgressIndicator(color: AppColors.mainColor));
        } else if (allFlashCards.isNotEmpty) {
          return ListView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemCount: allFlashCards.length,
            itemBuilder: (context, index) => CardWidget(
              flashCard: allFlashCards[index],
              index: index,
            ),
          );
        } else {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                  image: AssetImage(Images.sorry),
                  fit: BoxFit.cover,
                  height: 250.w,
                  width: 250.w),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30).w,
                child: Text(
                  "There is no Flash Card yet!",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: AppColors.secondary, fontSize: 25.sp),
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
