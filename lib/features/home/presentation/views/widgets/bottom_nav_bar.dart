import 'package:flash_card_quiz/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final void Function(int)? onTap;

  const BottomNavBar(
      {super.key, required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(

        borderRadius: BorderRadius.only(
          topRight: Radius.circular(15.r),
          topLeft: Radius.circular(15.r),
        ),
      ),
      child: BottomNavigationBar(
        currentIndex: currentIndex,
        elevation: 30,
        iconSize: 35.sp,
        items: items.map<BottomNavigationBarItem>((value) {
          return BottomNavigationBarItem(
            icon: value.icon,
            label: value.label,
            tooltip: value.label,
          );
        }).toList(),
        onTap: onTap,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: Colors.white70,
        selectedItemColor: AppColors.mainColor,
        unselectedItemColor: AppColors.mainColor.withOpacity(.5),
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}

final List<BottomNavigationBarItem> items = [
  const BottomNavigationBarItem(
    icon: Icon(
      Icons.home_outlined,
    ),
    label: 'home_outlined',
  ),
  const BottomNavigationBarItem(
    icon: Icon(
      Icons.person_outline,
    ),
    label: 'person_outline',
  ),
];
