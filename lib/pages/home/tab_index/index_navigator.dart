import 'package:flutter/material.dart';
import 'package:hook_up_rent/pages/home/tab_index/index_navigator_item.dart';
import 'package:hook_up_rent/widgets/common_image.dart';

class IndexMavigator extends StatelessWidget {
  const IndexMavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 6, bottom: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: indexNavigatorItemList
            .map((item) => InkWell(
                  onTap: () {
                    // 点击
                    item.onTap(context);
                  },
                  child: Column(
                    children: [
                      CommonImage(
                        item.imageUrl,
                        width: 48,
                        height: 48,
                      ),
                      Text(
                        item.title,
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 14),
                      ),
                    ],
                  ),
                ))
            .toList(),
      ),
    );
  }
}
