import 'package:flutter/material.dart';
import 'package:hook_up_rent/widgets/common_image.dart';
import 'index_Recommond_data.dart';

var textStyle = const TextStyle(fontSize: 14, fontWeight: FontWeight.w600);

class IndexRecommondItemWidget extends StatelessWidget {
  final IndexRecommendItem data;

  const IndexRecommondItemWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(data.navigatorUrl);
      },
      child: Container(
        decoration: const BoxDecoration(color: Colors.white),
        width: (MediaQuery.of(context).size.width - 10 * 3) / 2,
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(
                  data.title,
                  style: textStyle,
                ),
                Text(
                  data.subTitle,
                  style: textStyle,
                ),
              ],
            ),
            CommonImage(
              data.imageUrl,
              width: 55,
            ),
          ],
        ),
      ),
    );
  }
}
