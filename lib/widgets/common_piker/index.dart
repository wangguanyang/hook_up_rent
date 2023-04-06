import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CommonPiker {
  static Future<int?> showPiker({
    BuildContext? context,
    List<String>? options,
    int? value,
    double? height = 300,
  }) {
    return showCupertinoModalPopup<int>(
        context: context!,
        builder: (BuildContext context) {
          var controller = FixedExtentScrollController(initialItem: value!);
          return Container(
            color: Colors.grey,
            height: height, 
            child: Column(
              children: [
                Container(
                  color: Colors.grey[200],
                  height: 40.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text(
                          '取消',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(controller.selectedItem);
                        },
                        child: const Text(
                          '确认',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                    child: CupertinoPicker(
                  scrollController: controller,
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  itemExtent: 32,
                  onSelectedItemChanged: (val) {},
                  children: options!.map((item) => Text(item)).toList(),
                ))
              ],
            ),
          );
        });
  }
}
