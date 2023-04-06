import 'package:flutter/material.dart';
import 'package:hook_up_rent/pages/home/info/data.dart';
import 'package:hook_up_rent/widgets/common_image.dart';

var textStyle = const TextStyle(color: Colors.black54);

class ItemWidget extends StatelessWidget {
  final InfoItem data;

  const ItemWidget(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
      child: Row(
        children: [
          CommonImage(
            data.imageUrl,
            width: 120,
            height: 90,
          ),
          const Padding(padding: EdgeInsets.only(left: 10)),
          Expanded(
              child: Column(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween, // 需要固定高度才生效
                  children: [
                Text(
                  data.title,
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w600),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      data.source,
                      style: textStyle,
                    ),
                    Text(
                      data.time,
                      style: textStyle,
                    )
                  ],
                ),
              ]))
        ],
      ),
    );
  }
}
