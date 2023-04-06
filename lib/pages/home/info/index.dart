import 'package:flutter/material.dart';
import 'package:hook_up_rent/pages/home/info/item_widget.dart';
import 'data.dart';

class Info extends StatelessWidget {
  final bool showTitle;
  final List<InfoItem> data_list;

  const Info({Key? key, this.showTitle = false, this.data_list = infoData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // 房屋资讯详情
        
      },
      child: Container(
        child: Column(
          children: <Widget>[
            // header
            if (showTitle)
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.all(10),
                child: Text(
                  '最新资讯',
                  style:
                      TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
                ),
              ),
    
            // body
            Column(children: data_list.map((item) => ItemWidget(item)).toList()),
          ],
        ),
      ),
    );
  }
}
