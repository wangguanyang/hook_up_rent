import 'package:flutter/material.dart';
import 'package:hook_up_rent/widgets/common_image.dart';

class Advertisment extends StatelessWidget {
  const Advertisment({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      margin: EdgeInsets.only(top: 30.0, bottom: 20.0, left: 10.0, right: 10.0),
      child: CommonImage(
        'https://img0.baidu.com/it/u=2496911733,2282231582&fm=253&fmt=auto&app=138&f=JPEG?w=1448&h=500',
        fit: BoxFit.fill,
      ),
    );
  }
}
