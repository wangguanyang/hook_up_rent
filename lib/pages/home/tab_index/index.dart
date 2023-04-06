import 'package:flutter/material.dart';
import 'package:hook_up_rent/pages/home/info/index.dart';
import 'package:hook_up_rent/pages/home/tab_index/index_recommond.dart';
import 'package:hook_up_rent/widgets/common_swiper.dart';
import 'package:hook_up_rent/widgets/search_bar/index.dart';
import 'index_navigator.dart';

// 图片宽度750 高度424

class TabIndex extends StatelessWidget {
  const TabIndex({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
      body: ListView(
        children: [
          CommonSwiper(),
          IndexMavigator(),
          IndexRecommand(),
          Info(
            showTitle: true,
          ),
        ],
      ),
    );
  }
}
