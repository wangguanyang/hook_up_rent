import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

// const List<String> defaultImages = [
//   'http://ww3.sinaimg.cn/large/006y8mN6ly1g6e2tdgve1j30ku0bsn75.jpg',
//   'http://ww3.sinaimg.cn/large/006y8mN6ly1g6e2whp87sj30ku0bstec.jpg',
//   'http://ww3.sinaimg.cn/large/006y8mN6ly1g6e2tl1v3bj30ku0bs77z.jpg',
// ];

// 设置图片宽高
var imageWidth = 750.0;
var imageHeight = 424.0;
var imageWidgetHeightRatio = imageWidth / imageHeight; // 宽高比

class CommonImagePiker extends StatefulWidget {
  final ValueChanged? onChange;

  const CommonImagePiker({super.key, this.onChange});

  @override
  State<CommonImagePiker> createState() => _CommonImagePikerState();
}

class _CommonImagePikerState extends State<CommonImagePiker> {
  List<XFile> files = [];
  final _picker = ImagePicker();

  _pikeImage() async {
    XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image == null) return;
    setState(() {
      files = files..add(image);

      // 通知父级图片数据发生了变化
      if (widget.onChange != null) {
        widget.onChange!(files);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = (MediaQuery.of(context).size.width - 10.0 * 4) / 3;
    var height = width / imageWidgetHeightRatio;
    // '+' 按钮
    Widget addButton = GestureDetector(
      onTap: () {
        // 添加图片
        _pikeImage();
      },
      behavior: HitTestBehavior.translucent,
      child: Container(
          width: width,
          height: height,
          color: Colors.grey,
          child: const Center(
            child: Text(
              '+',
              style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.w100),
            ),
          )),
    );

    // 图片
    Widget wrapper(XFile file) {
      return Stack(
        clipBehavior: Clip.none,
        children: [
          Image.file(
            File(file.path),
            width: width,
            height: height,
            fit: BoxFit.cover,
          ),
          Positioned(
            right: -20,
            top: -20,
            child: IconButton(
              onPressed: () {
                setState(() {
                  // 删除
                  files = files..remove(file);
                  if (widget.onChange != null) {
                    widget.onChange!(file);
                  }
                });
              },
              icon: const Icon(
                Icons.delete_forever,
                color: Colors.red,
              ),
            ),
          ),
        ],
      );
    }

    List<Widget> list = files.map((file) => wrapper(file)).toList()
      ..add(addButton);

    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Wrap(
        spacing: 10.0,
        runSpacing: 10.0,
        children: list,
      ),
    );
  }
}
