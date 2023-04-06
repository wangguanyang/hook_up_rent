import 'package:flutter/material.dart';

class Item extends StatelessWidget {
  final String? title;
  final bool? isActive;
  final Function(BuildContext)? onTap;
  const Item({super.key, this.title, this.isActive, this.onTap});

  @override
  Widget build(BuildContext context) {
    var itemColor = isActive! ? Colors.green : Colors.black87;

    return GestureDetector(
        onTap: () {
          if (onTap != null) onTap!(context);
        },
        child: Container( 
          child: Row(
            children: [
              Text(
                title!,
                style: TextStyle(fontSize: 18, color: itemColor),
              ),
              Icon(
                Icons.keyboard_arrow_down,
                color: itemColor,
              )
            ],
          ),
        ));
  }
}
