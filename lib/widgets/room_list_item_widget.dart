import 'package:flutter/material.dart';
import 'package:hook_up_rent/widgets/common_image.dart';
import '../pages/home/tab_search/data_list.dart';
import 'commom_tag.dart';

class RoomListItemWidget extends StatelessWidget {
  final RoomListItemData data;

  const RoomListItemWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // 点击跳转房屋详情
        Navigator.of(context).pushNamed('roomDetail/${data.id}');
      },
      child: Container(
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
        child: Row(
          children: [
            CommonImage(
              data.imageUrl,
              width: 132.5,
              height: 100.0,
            ),
            const Padding(padding: EdgeInsets.only(left: 10.0)),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                Text(
                  data.subTitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Wrap(
                  children: data.tags.map((item) => CommondTag(item)).toList(),
                ),
                Text(
                  '${data.price} 元/月',
                  style: const TextStyle(
                      color: Colors.orange, fontWeight: FontWeight.w600),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
