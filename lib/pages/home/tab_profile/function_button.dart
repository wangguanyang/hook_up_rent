import 'package:flutter/material.dart';
import 'package:hook_up_rent/pages/home/tab_profile/function_button_data.dart';

import 'function_button_widget.dart';

class FunctionButton extends StatelessWidget {
  const FunctionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Wrap(
            spacing: 1.0, // 水平方向间距
            runSpacing: 1.0, // 垂直方向间距
            children: list
                .map(
                  (item) => FuntionButtonWidget(item),
                )
                .toList()));
  }
}
