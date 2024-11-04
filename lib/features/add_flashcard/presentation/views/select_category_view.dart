import 'package:flash_card_quiz/core/shared_widgets/default_appbar.dart';
import 'widgets/select_category_body.dart';
import 'package:flutter/material.dart';

class SelectCategoryView extends StatelessWidget {
  const SelectCategoryView({super.key,});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: DefaultAppbar(title: 'Choose Flash Card Category'),
      body: SelectCategoryBody(),
    );
  }
}
