import 'package:flash_card_quiz/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'default_icon_button.dart';

class DefaultAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const DefaultAppbar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: DefaultIconButton(
          iconData: Icons.arrow_back_ios_rounded,
          onPressed: () {
            Navigator.pop(context);
          }),
      title: Text(
        title,
        style: TextStyle(
            color: AppColors.secondary,
            fontSize: 20.sp,
            fontWeight: FontWeight.w500),
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(70.h);
}
