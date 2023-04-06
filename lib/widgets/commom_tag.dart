import 'package:flutter/material.dart';

class CommondTag extends StatelessWidget {
  final String title;
  final Color color;
  final Color backgroundColor;

  const CommondTag.origin(this.title,
      {Key ? key, this.color = Colors.black, this.backgroundColor = Colors.grey})
      : super(key: key);

// 工厂方法(组件同名函数),处理不同title的字体颜色和背景色
  factory CommondTag(String title) {
    switch (title) {
      case '近地铁':
        return CommondTag.origin(
          title,
          color: Colors.red,
          backgroundColor: Colors.red.shade50,
        );
      case '集中供暖':
        return CommondTag.origin(
          title,
          color: Colors.blue,
          backgroundColor: Colors.blue.shade50,
        );
      case '新上':
        return CommondTag.origin(
          title,
          color: Colors.green,
          backgroundColor: Colors.green.shade50,
        );
      case '随时看房':
        return CommondTag.origin(
          title,
          color: Colors.purple,
          backgroundColor: Colors.purple.shade50,
        );
      default:
        return CommondTag.origin(title);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 4),
      padding:
          const EdgeInsets.only(left: 4.0, right: 4.0, top: 2.0, bottom: 2.0),
      decoration: BoxDecoration(
          color: backgroundColor, borderRadius: BorderRadius.circular(8.0)),
      child: Text(
        title,
        style: TextStyle(fontSize: 10.0, color: color),
      ),
    );
  }
}
