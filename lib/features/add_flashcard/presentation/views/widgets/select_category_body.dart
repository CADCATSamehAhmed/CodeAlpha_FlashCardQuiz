import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'category_card.dart';

class SelectCategoryBody extends StatelessWidget {
  const SelectCategoryBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15).w,
      child: const Wrap(
        children: [
          CategoryCard(
            iconData: Icons.functions_sharp,
            label: 'math',
          ),
          CategoryCard(
            iconData: Icons.science,
            label: 'science',
          ),
          CategoryCard(
            iconData: Icons.temple_hindu_sharp,
            label: 'history',
          ),
          CategoryCard(
            iconData: Icons.translate_outlined,
            label: 'language',
          ),
          CategoryCard(
            iconData: Icons.quiz_outlined,
            label: 'other',
          ),
          CategoryCard(
            iconData: Icons.computer,
            label: 'computer',
          ),
        ],
      ),
    );
  }
}
