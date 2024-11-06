import 'package:flash_card_quiz/features/home/presentation/view_model/home_cubit.dart';
import 'package:flash_card_quiz/features/home/presentation/views/widgets/all_cards_body.dart';
import 'package:flash_card_quiz/features/home/presentation/views/widgets/home_app_bar.dart';
import 'package:flash_card_quiz/features/home/presentation/views/widgets/home_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'widgets/bottom_nav_bar.dart';
import 'widgets/home_floating_button.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          HomeCubit cubit = HomeCubit.get(context);
          return Scaffold(
            appBar: appBars[cubit.currentIndex],
            body: homeScreens[cubit.currentIndex],
            bottomNavigationBar: BottomNavBar(
                currentIndex: cubit.currentIndex,
                onTap: (int index) async{
                  await cubit.changeBottomNavBarIndex(index);
                }),
            floatingActionButton:HomeFloatingButton(index: cubit.currentIndex),
            floatingActionButtonLocation:FloatingActionButtonLocation.centerDocked,
          );
        });
  }
}
List<PreferredSizeWidget> appBars = [
  const HomeAppBar(),
  const AllCardsAppBar(),
];
List<Widget> homeScreens = [
  const HomeBody(),
  const AllCardsBody(),
];