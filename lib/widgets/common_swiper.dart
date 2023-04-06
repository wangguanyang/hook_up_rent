import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:hook_up_rent/widgets/common_image.dart';

const List<String> defaultImages = [
  'https://img0.baidu.com/it/u=322398742,2153165459&fm=253&fmt=auto&app=138&f=JPEG?w=1226&h=468',
  'https://hbimg.b0.upaiyun.com/f192acfc0a6bd3de9cb5c24342359204d72360f932322-Wmp99r_fw658',
  'https://img.zcool.cn/community/01ff225ee83d19a80120662110411f.jpg?x-oss-process=image/auto-orient,1/resize,m_lfit,w_1280,limit_1/sharpen,100'
];

var imageWidth = 424;
var imageHeight = 750;

class CommonSwiper extends StatelessWidget {
  final List<String> images;

  const CommonSwiper( {Key? key, this.images = defaultImages}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.width * imageWidth / imageHeight,
      child: Swiper(
        autoplay: true,
        itemBuilder: (BuildContext context, int index) {
          return CommonImage(
            images[index],
            fit: BoxFit.fill,
          );
        },
        itemCount: 3,
        pagination: const SwiperPagination(),
      ),
    );
  }
}
