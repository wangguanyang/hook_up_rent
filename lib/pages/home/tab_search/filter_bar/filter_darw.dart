import 'package:flutter/material.dart';
import 'package:hook_up_rent/pages/home/tab_search/filter_bar/data.dart';
import 'package:hook_up_rent/pages/scoped_model/room_filter.dart';
import 'package:hook_up_rent/pages/utils/scoped_model_helper.dart';
import 'package:hook_up_rent/widgets/common_title.dart';

class FilterDraw extends StatelessWidget {
  const FilterDraw({super.key});

  @override
  Widget build(BuildContext context) {
    // 4.1 get dataList
    var dataList = ScopedModelHelper.getModel<FilterBarModel>(context).dataList;
    roomTypeList = dataList['roomTypeList']!;
    orientedList = dataList['orientedList']!;
    floorList = dataList['floorList']!;

    // 4.2 get selectedList
    var selectedIds = ScopedModelHelper.getModel<FilterBarModel>(context)
        .selectedList
        .toList();

    // 5.点击item导致模型数据发生改变，同步模型数据
    _onChange(String val) {
      ScopedModelHelper.getModel<FilterBarModel>(context)
          .selectedListToggleItem(val);
    }

    return Drawer(
        child: SafeArea(
            child: ListView(
      children: [
        CommonTitle(title: '户型'),
        FilterDrawerWithItem(
          list: roomTypeList,
          selectedIds: selectedIds,
          onChange: _onChange,
        ),
        CommonTitle(title: '朝向'),
        FilterDrawerWithItem(
            list: orientedList, selectedIds: selectedIds, onChange: _onChange),
        CommonTitle(title: '楼层'),
        FilterDrawerWithItem(
            list: floorList, selectedIds: selectedIds, onChange: _onChange),
      ],
    )));
  }
}

class FilterDrawerWithItem extends StatelessWidget {
  final List<GeneralType>? list;
  final List<String>? selectedIds;
  final ValueChanged<String>? onChange;

  const FilterDrawerWithItem(
      {super.key, this.list, this.selectedIds, this.onChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Wrap(
          runSpacing: 10.0,
          spacing: 10.0,
          children: list!.map((item) {
            bool isActive = selectedIds!.contains(item.id);
            return GestureDetector(
              onTap: () {
                // item点击
                if (onChange != null) onChange!(item.id);
              },
              behavior: HitTestBehavior.translucent,
              child: Container(
                height: 40.0,
                width: 100.0,
                decoration: BoxDecoration(
                    color: isActive ? Colors.green : Colors.white,
                    border: Border.all(width: 1.0, color: Colors.green)),
                child: Center(
                  child: Text(
                    item.name,
                    style: TextStyle(
                        color: isActive ? Colors.white : Colors.green),
                  ),
                ),
              ),
            );
          }).toList()),
    );
  }
}
