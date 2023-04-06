import 'package:flutter/material.dart';
import 'package:hook_up_rent/pages/home/info/index.dart';
import 'package:hook_up_rent/pages/home/room_detail/data.dart';
import 'package:hook_up_rent/pages/utils/common_toast.dart';
import 'package:hook_up_rent/widgets/commom_tag.dart';
import 'package:hook_up_rent/widgets/common_swiper.dart';
import 'package:hook_up_rent/widgets/common_title.dart';
import 'package:hook_up_rent/widgets/room_appliance.dart';
import 'package:share_plus/share_plus.dart';

class RoomDetailPage extends StatefulWidget {
  final String roomId;
  const RoomDetailPage({super.key, required this.roomId});

  @override
  State<RoomDetailPage> createState() => _RoomDetailPageState();
}

class _RoomDetailPageState extends State<RoomDetailPage> {
  late RoomDetailData data;
  bool isLike = false; // 是否收藏，默认false
  bool showAllText = false; // 房源概况是否展示全部内容 默认折叠
  @override
  void initState() {
    setState(() {
      data = defaultData;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unnecessary_null_comparison
    if (data == null) return Container();
    bool showTextTool = data.subTitle.length > 100;
    return Scaffold(
      appBar: AppBar(
        title: Text(data.title),
        actions: [
          IconButton(
              onPressed: (() {
                Share.share('https://pub.dev');
              }),
              icon: const Icon(Icons.share))
        ],
      ),
      body: Stack(
        children: [
          ListView(
            children: [
              CommonSwiper(images: data.houseImgs),
              CommonTitle(title: data.title),
              Container(
                padding: const EdgeInsets.only(left: 10.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      data.price.toString(),
                      style: const TextStyle(fontSize: 20, color: Colors.pink),
                    ),
                    const Text(
                      '元/月(押一付三)',
                      style: TextStyle(fontSize: 14.0, color: Colors.pink),
                    )
                  ],
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.only(left: 10.0, top: 6.0, bottom: 6.0),
                child: Wrap(
                  spacing: 4.0,
                  children: data.tags.map((tag) => CommondTag(tag)).toList(),
                ),
              ),
              const Divider(
                color: Colors.grey,
                indent: 10.0,
                endIndent: 10.0,
              ),
              Container(
                padding:
                    const EdgeInsets.only(left: 10.0, top: 6.0, bottom: 6.0),
                child: Wrap(
                  runSpacing: 20.0,
                  children: [
                    BaseInfoItem(
                      content: '面积：${data.size}平方米',
                    ),
                    BaseInfoItem(
                      content: '楼层：${data.floor}',
                    ),
                    BaseInfoItem(
                      content: '房型：${data.roomType}',
                    ),
                    const BaseInfoItem(
                      content: '装修： 精装',
                    ),
                  ],
                ),
              ),
              const CommonTitle(title: '房屋配置'),
              RoomApplianceList(
                list: data.applicances,
              ),
              const CommonTitle(title: '房屋概况'),
              Container(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    showAllText
                        ? Text(
                            data.subTitle,
                          )
                        : Text(
                            data.subTitle,
                            maxLines: 5,
                            overflow: TextOverflow.ellipsis,
                          ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        showTextTool
                            ? GestureDetector(
                                onTap: () {
                                  setState(() {
                                    showAllText = !showAllText;
                                  });
                                },
                                child: Row(
                                  children: [
                                    Text(showAllText ? '收起' : '展开'),
                                    Icon(showAllText
                                        ? Icons.keyboard_arrow_up
                                        : Icons.keyboard_arrow_down),
                                  ],
                                ),
                              )
                            : Container(),
                        TextButton(
                            onPressed: () {
                              // 举报点击
                              CommonToast.showToast('举报成功！');
                            },
                            child: const Text(
                              '举报',
                              style: TextStyle(color:  Colors.black),
                            )),
                      ],
                    )
                  ],
                ),
              ),
              const CommonTitle(title: '猜你喜欢'),
              const Info(),
              const SizedBox(height: 80.0),
            ],
          ),
          Positioned(
              width: MediaQuery.of(context).size.width,
              height: 100.0,
              bottom: 0,
              child: Container(
                color: Colors.grey[200],
                padding: const EdgeInsets.only(
                    top: 10.0, left: 20.0, right: 20.0, bottom: 20.0),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        // 点击收藏
                        setState(() {
                          isLike = !isLike;
                        });
                      },
                      child: Container(
                        height: 50.0,
                        width: 40.0,
                        margin: const EdgeInsets.only(right: 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              isLike ? Icons.star : Icons.star_border,
                              color: isLike ? Colors.green : Colors.black,
                              size: 24,
                            ),
                            Text(
                              isLike ? '已收藏' : '收藏',
                              style: const TextStyle(fontSize: 12.0),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                          height: 50.0,
                          child: ElevatedButton(
                            onPressed: () {
                              // 联系房东
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue),
                            child: const Text('联系房东',
                                style: TextStyle(fontSize: 18.0)),
                          )),
                    ),
                    // 占位
                    const SizedBox(
                      height: 50.0,
                      width: 8.0,
                    ),
                    Expanded(
                      child: SizedBox(
                          height: 50.0,
                          child: ElevatedButton(
                            onPressed: () {
                              // 预约看房
                            },
                            child: const Text(
                              '预约看房',
                              style: TextStyle(fontSize: 18.0),
                            ),
                          )),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}

// BaseInfoItem方法封装
class BaseInfoItem extends StatelessWidget {
  final String content;
  const BaseInfoItem({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (MediaQuery.of(context).size.width - 10.0 * 3) / 2,
      child: Text(
        content,
        style: const TextStyle(fontSize: 16.0),
      ),
    );
  }
}
