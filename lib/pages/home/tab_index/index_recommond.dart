import 'package:flutter/material.dart';
import 'index_Recommond_data.dart';
import 'index_recommond_item_widget.dart';

// ignore: slash_for_doc_comments
/**
构造函数名为 IndexRecommand，是一个 StatelessWidget 的构造函数。
它有一个可选的 Key 类型的 key 参数，用于标识这个组件。
它有一个名为 data_list 的可选的 List 类型的参数，用于传递数据列表。
如果调用这个构造函数时不传递 data_list 参数，它将会默认使用 indexRecommendData 这个常量列表。
super(key: key) 表示调用父类的构造函数，并传递 key 参数。
需要注意的是，这里使用了 const 关键字来创建一个常量构造函数。
这意味着，当这个构造函数被调用时，它会返回一个常量对象，
这个对象在整个应用程序生命周期内都是不变的。这可以提高应用程序的性能和效率。 
*/

class IndexRecommand extends StatelessWidget {
  final List<IndexRecommendItem> data_list;

  const IndexRecommand({
    Key? key,
    this.data_list = indexRecommendData, // 指定默认数据源
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(color: Color(0x08000000)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                '房屋推荐',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
              ),
              Text(
                '更多',
                style: TextStyle(color: Colors.black54),
              ),
            ],
          ),
          // const Padding(padding: EdgeInsets.all(5)),
          const SizedBox(height: 10),
          Wrap(
            spacing: 10, // item x方向间距
            runSpacing: 10.0, // y方向 行间距
            children: data_list
                .map((item) => IndexRecommondItemWidget(
                      data: item,
                    ))
                .toList(),
          )
        ],
      ),
    );
  }
}
