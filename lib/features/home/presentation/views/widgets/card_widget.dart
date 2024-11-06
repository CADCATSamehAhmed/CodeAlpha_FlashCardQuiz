import 'package:flash_card_quiz/core/themes/app_colors.dart';
import 'package:flash_card_quiz/features/home/presentation/view_model/home_cubit.dart';
import 'package:flash_card_quiz/features/quiz/data/models/flash_card_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardWidget extends StatelessWidget {
  final FlashCardModel flashCard;
  final int index;
  const CardWidget({super.key, required this.flashCard, required this.index});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return InkWell(
          child: Container(
            height: 100.w,
            margin: const EdgeInsets.all(15).w,
            decoration: BoxDecoration(
                color: AppColors.mainColor.withOpacity(.1),
                borderRadius: BorderRadius.circular(10.r)),
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                Center(
                  child: ListTile(
                    title: Text(
                      "Q ${index+1}: ${flashCard.question}",
                      style:
                          TextStyle(color: AppColors.mainColor, fontSize: 18.sp),
                    ),
                    subtitle: Text(
                      "Answer: ${flashCard.rightAnswer}",
                      style:
                      TextStyle(color: AppColors.mainColor, fontSize: 16.sp),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    HomeCubit.get(context).deleteFlashCard(
                        flashCard.category, flashCard.flashCardId, flashCard);
                  },
                  icon: const Icon(Icons.highlight_remove),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
