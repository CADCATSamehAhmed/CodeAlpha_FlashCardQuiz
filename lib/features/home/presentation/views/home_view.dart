import 'package:flash_card_quiz/features/home/presentation/view_model/home_cubit.dart';
import 'package:flash_card_quiz/features/home/presentation/views/widgets/home_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import 'widgets/bottom_nav_bar.dart';
import 'widgets/home_floating_button.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeStates>(
          listener: (context, state) {},
          builder: (context, state) {
            HomeCubit cubit = HomeCubit.get(context);
            return Scaffold(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              body: homeScreens[cubit.currentIndex],
              bottomNavigationBar: BottomNavBar(
                  currentIndex: cubit.currentIndex,
                  onTap: (int index) {
                    cubit.changeBottomNavBarIndex(index);
                  }),
              floatingActionButton:HomeFloatingButton(index: cubit.currentIndex),
              floatingActionButtonLocation:FloatingActionButtonLocation.centerDocked,
            );
          }),
    );
  }
}
List<Widget> homeScreens = [
  const HomeBody(),
  Container()
];