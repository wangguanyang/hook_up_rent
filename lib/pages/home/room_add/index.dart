import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hook_up_rent/widgets/common_floating_action_button.dart';
import 'package:hook_up_rent/widgets/common_form_item.dart';
import 'package:hook_up_rent/widgets/common_image_piker.dart';
import 'package:hook_up_rent/widgets/common_radio_form_item.dart';
import 'package:hook_up_rent/widgets/common_select_form_item.dart';
import 'package:hook_up_rent/widgets/common_title.dart';
import 'package:hook_up_rent/widgets/room_appliance.dart';

class RoomAddPage extends StatefulWidget {
  const RoomAddPage({super.key});

  @override
  State<RoomAddPage> createState() => _RoomAddPageState();
}

class _RoomAddPageState extends State<RoomAddPage> {
  /// 租赁类型
  int rentType = 0;

  /// 装修类型
  int decorationType = 0;

  /// 户型
  int roomType = 0;

  /// 楼层
  int floor = 0;

  /// 朝向
  int oriented = 0;

  var titleController = TextEditingController();
  var descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('房源发布'),
      ),
      body: ListView(
        children: [
          const CommonTitle(title: '房源信息'),
          // 小区
          CommonFormItem(
            label: '小区',
            contentBuilder: (context) => Container(
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  Navigator.of(context).pushNamed('search');
                },
                child: Container(
                  height: 40.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        '请选择小区',
                        style: TextStyle(fontSize: 16.0),
                      ),
                      Icon(Icons.keyboard_arrow_right),
                    ],
                  ),
                ),
              ),
            ),
          ),
          // 租金
          CommonFormItem(
            label: '租金',
            hintText: '请输入租金',
            suffixText: '元/月',
            controller: TextEditingController(),
          ),
          // 房屋大小
          CommonFormItem(
            label: '大小',
            hintText: '请输入房屋大小',
            suffixText: '平方米',
            controller: TextEditingController(),
          ),
          // 租赁方式
          CommonRadioFormItem(
            label: '租赁方式',
            options: const ['合租', '整租'],
            value: rentType,
            onChange: (index) {
              setState(() {
                rentType = index!;
              });
            },
          ),
          // 户型
          CommonSelectFormItem(
            label: '户型',
            value: roomType,
            onChange: (val) {
              setState(() {
                roomType = val!;
              });
            },
            options: const ['一室', '二室', '三室', '四室'],
          ),
          // 楼层
          CommonSelectFormItem(
            label: '楼层',
            value: floor,
            onChange: (val) {
              setState(() {
                floor = val!;
              });
            },
            options: const ['高楼层', '中楼层', '低楼层'],
          ),
          // 朝向
          CommonSelectFormItem(
            label: '朝向',
            value: oriented,
            onChange: (val) {
              setState(() {
                oriented = val!;
              });
            },
            options: const ['东', '南', '西', '北'],
          ),
          // 装修
          CommonRadioFormItem(
            label: '装修',
            options: const ['精装', '简装'],
            value: decorationType,
            onChange: (index) {
              setState(() {
                decorationType = index!;
              });
            },
          ),
          const CommonTitle(title: '房屋图像'),
          const CommonImagePiker(),
          const CommonTitle(title: '房屋标题'),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: TextField(
              controller: titleController,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: '请输入标题（例如：整租,小区名 2室 2000元）',
              ),
            ),
          ),
          const CommonTitle(title: '房屋配置'),
          //  房屋配置
          RoomAppliance((data) {}),
          const CommonTitle(title: '房屋描述'),
          Container(
            margin: const EdgeInsets.only(bottom: 100.0),
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: TextField(
              controller: descController,
              maxLines: 10,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: '请输入房屋描述内容',
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CommonFloatingActionButton(
        title: '发布',
        onTap: () {
          Navigator.of(context).pushNamed('submit');
        },
      ),
    );
  }
}
