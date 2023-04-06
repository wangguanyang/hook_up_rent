import 'package:flutter/material.dart';
import 'package:hook_up_rent/widgets/common_image.dart';

class SearchBar extends StatefulWidget {
  final bool? showLocation; //是否显示位置
  final Function? goBackCallback; //回退
  final String? inputValue; //搜索框值
  final String defaultInputValue; //默认显示值
  final Function? onCancel; //取消按钮
  final bool? showMap; //是否显示地图按钮
  final Function? onSearch; //点击搜索框触发
  final ValueChanged<String>? onSearchSubmit; // 点击回车触发

  const SearchBar(
      {Key? key,
      this.showLocation,
      this.goBackCallback,
      this.inputValue = '',
      this.defaultInputValue = '请输入搜索词',
      this.onCancel,
      this.showMap,
      this.onSearch,
      this.onSearchSubmit})
      : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  String _searchWords = '';
  late TextEditingController _controller;
  late FocusNode _focus; // 焦点对象
  void _onClean() {
    setState(() {
      _controller.clear();
      _searchWords = '';
    });
  }

  @override
  // 初始化
  void initState() {
    _focus = FocusNode();
    _controller = TextEditingController(text: widget.inputValue);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          // 当前位置
          if (widget.showLocation ?? false)
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: GestureDetector(
                onTap: () {
                  // 位置
                },
                child: Row(
                  children: const [
                    Icon(
                      Icons.room,
                      color: Colors.green,
                      size: 14,
                    ),
                    Text(
                      '北京',
                      style: TextStyle(color: Colors.black, fontSize: 16.0),
                    ),
                  ],
                ),
              ),
            ),

          // 返回
          if (widget.goBackCallback != null)
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: GestureDetector(
                onTap: widget.goBackCallback
                    as GestureTapCallback, // 类型转换，以便在回调函数使用
                child: const Icon(
                  Icons.chevron_left,
                  color: Colors.black87,
                ),
              ),
            ),

          // 搜索框
          Expanded(
            child: Container(
              height: 34.0,
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(17.0)),
              margin: const EdgeInsets.only(right: 10.0),
              child: TextField(
                  controller: _controller,
                  focusNode: _focus, // 控制焦点
                  onTap: () {
                    if (widget.onSearchSubmit == null) {
                      _focus.unfocus(); // 不是搜索页则失去焦点
                    }
                    if (widget.onSearch != null) {
                      widget.onSearch!();
                    }
                  },
                  onSubmitted: widget.onSearchSubmit,
                  textInputAction: TextInputAction.search,
                  style: const TextStyle(fontSize: 14.0),
                  // 监听输入框
                  onChanged: (String value) {
                    setState(() {
                      _searchWords = value;
                    });
                  },
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: '请输入搜索词',
                    hintStyle:
                        const TextStyle(fontSize: 14.0, color: Colors.grey),
                    contentPadding: const EdgeInsets.only(top: 1.0, left: -10),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        _onClean(); // 清除方法
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, top: 2),
                        child: Icon(
                          Icons.clear,
                          size: 18.0,
                          color: _searchWords == ''
                              ? Colors.grey[200]
                              : Colors.grey,
                        ),
                      ),
                    ),
                    icon: const Padding(
                      padding: EdgeInsets.only(left: 10, top: 2),
                      child: Icon(
                        Icons.search,
                        size: 18,
                        color: Colors.grey,
                      ),
                    ),
                  )),
            ),
          ),

          if (widget.onCancel != null)
            GestureDetector(
              onTap: widget.onCancel as GestureTapCallback,
              child: const Padding(
                padding: EdgeInsets.only(right: 10.0),
                child: Text(
                  '取消',
                  style: TextStyle(color: Colors.black, fontSize: 14.0),
                ),
              ),
            ),
          if (widget.showMap ?? false)
            const CommonImage('static/icons/widget_search_bar_map.png')
        ],
      ),
    );
  }
}
