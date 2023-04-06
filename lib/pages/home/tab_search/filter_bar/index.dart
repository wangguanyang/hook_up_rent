import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hook_up_rent/pages/scoped_model/room_filter.dart';
import 'package:hook_up_rent/pages/utils/scoped_model_helper.dart';
import 'package:hook_up_rent/widgets/common_piker/index.dart';

import 'data.dart';
import 'item.dart';

class FilterBar extends StatefulWidget {
  final ValueChanged<FilterBarResult>? onChange;

  const FilterBar({super.key, this.onChange});

  @override
  State<FilterBar> createState() => _FilterBarState();
}

class _FilterBarState extends State<FilterBar> {
  bool isAreaActive = false;
  bool isRentTypeActive = false;
  bool isPriceActive = false;
  bool isFilterActive = false;

  String areaId = '';
  String rentTypeId = '';
  String priceId = '';
  List<String> moreIds = [];

  /// 区域
  _onAreaChange(context) {
    setState(() {
      isAreaActive = true;
    });

    var result = CommonPiker.showPiker(
        context: context,
        value: 0,
        options: areaList.map((item) => item.name).toList());

    result.then((index) {
      if (index == null) return;
      setState(() {
        areaId = areaList[index].id;
      });
      _onChange();
    }).whenComplete(() => setState(() {
          isAreaActive = false;
        }));
  }

  /// 价格
  _onPriceChange(context) {
    setState(() {
      isPriceActive = true;
    });

    var result = CommonPiker.showPiker(
        context: context,
        value: 0,
        options: priceList.map((item) => item.name).toList());

    result.then((index) {
      if (index == null) return;
      setState(() {
        priceId = priceList[index].id;
      });
      _onChange();
    }).whenComplete(() => setState(() {
          isPriceActive = false;
        }));
  }

  /// 方式
  _onRentTypeChange(context) {
    setState(() {
      isRentTypeActive = true;
    });

    var result = CommonPiker.showPiker(
        context: context,
        value: 0,
        options: rentTypeList.map((item) => item.name).toList());

    result.then((index) {
      if (index == null) return;
      setState(() {
        rentTypeId = rentTypeList[index].id;
      });
      _onChange();
    }).whenComplete(() => setState(() {
          isRentTypeActive = false;
        }));
  }

  /// 筛选
  _onFilterChange(context) {
    Scaffold.of(context).openEndDrawer();
  }

  _onChange() {
    var selectedList =
        ScopedModelHelper.getModel<FilterBarModel>(context).selectedList;

    if (widget.onChange != null) {
      widget.onChange!(FilterBarResult(
          areaId: areaId,
          rentTypeId: rentTypeId,
          priceId: priceId,
          moreId: selectedList.toList()));
    }
  }

  _setData() {
    Map<String, List<GeneralType>> dataList = Map<String, List<GeneralType>>();
    dataList['roomTypeList'] = roomTypeList;
    dataList['orientedList'] = orientedList;
    dataList['floorList'] = floorList;
    ScopedModelHelper.getModel<FilterBarModel>(context).dataList = dataList;
  }

  @override
  void initState() {
    Timer.run(_setData); // 2.用数据源给Model赋值 set dataList
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _onChange(); //  3.获取Model get selectedList
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 41.0,
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(width: 1.0, color: Colors.black12))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Item(
            title: '区域',
            isActive: isAreaActive,
            onTap: _onAreaChange,
          ),
          Item(
            title: '方式',
            isActive: isRentTypeActive,
            onTap: _onRentTypeChange,
          ),
          Item(
            title: '租金',
            isActive: isPriceActive,
            onTap: _onPriceChange,
          ),
          Item(
            title: '筛选',
            isActive: isFilterActive,
            onTap: _onFilterChange,
          ),
        ],
      ),
    );
  }
}
