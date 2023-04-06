import 'package:flutter/material.dart';

class CommonTitle extends StatelessWidget {
  final String title;
  const CommonTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      padding: const EdgeInsets.only(left: 10.0),
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: const TextStyle(
            color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.w600),
      ),
    );
  }
}
