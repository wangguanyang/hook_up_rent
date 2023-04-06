import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:hook_up_rent/pages/home/tab_search/data_list.dart';
import 'package:hook_up_rent/widgets/common_floating_action_button.dart';
import 'package:hook_up_rent/widgets/room_list_item_widget.dart';

class RoomManagePage extends StatelessWidget {
  const RoomManagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: CommonFloatingActionButton(
              title: '发布房源',
              onTap: () {
                Navigator.pushNamed(context, 'roomAdd');
              }),
          appBar: AppBar(
            title: const Text('房屋管理'),
            bottom: const TabBar(tabs: <Widget>[
              Tab(text: '空置'),
              Tab(text: '已出租'),
            ]),
          ),
          body: TabBarView(
            children: [
              ListView(
                  children: data_list
                      .map((item) => RoomListItemWidget(
                            data: item,
                          ))
                      .toList()),
              ListView(
                  children: data_list
                      .map((item) => RoomListItemWidget(
                            data: item,
                          ))
                      .toList()),
            ],
          )),
    );
  }
}
