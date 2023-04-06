import 'package:flutter/material.dart';
import 'package:hook_up_rent/pages/home/tab_search/data_list.dart';
import 'package:hook_up_rent/pages/home/tab_search/filter_bar/filter_darw.dart';
import 'package:hook_up_rent/widgets/room_list_item_widget.dart';
import 'package:hook_up_rent/widgets/search_bar/index.dart';

import 'filter_bar/index.dart';

class TabSearch extends StatefulWidget {
  const TabSearch({super.key});

  @override
  State<TabSearch> createState() => _TabSearchState();
}

class _TabSearchState extends State<TabSearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: FilterDraw(),
      appBar: AppBar(
        actions: [Container()],
        elevation: 0,
        title: SearchBar(
          showLocation: true,
          showMap: true,
          inputValue: '',
          onSearch: () {
            Navigator.of(context).pushNamed('search');
          },
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: <Widget>[
          const SizedBox(
            height: 40,
            child: FilterBar(),
          ),
          //  Expanded 嵌套ListView报错
          Expanded(
            child: ListView(
              children: data_list
                  .map((item) => RoomListItemWidget(
                        data: item,
                      ))
                  .toList(),
            ),
          )
        ],
      ),
    );
  }
}
