import 'package:flutter/material.dart';
import 'package:hook_up_rent/widgets/common_image.dart';

import 'function_button_data.dart';

class FuntionButtonWidget extends StatelessWidget {
  final FunctionButtonItem data;

  const FuntionButtonWidget(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // 点击事件
      onTap: () {
        if (data.onTapHandle != null) {
        data.onTapHandle!(context);
        }
      },
      child: Container(
        margin:const EdgeInsets.only(top: 30),
        width: MediaQuery.of(context).size.width * 0.33,
        child: Column(
          children: [CommonImage(data.imageUrl), Text(data.title)],
        ),
      ),
    );
  }
}
