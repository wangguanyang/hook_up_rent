import 'package:flutter/material.dart';
import 'package:hook_up_rent/widgets/common_form_item.dart';
import 'package:hook_up_rent/widgets/common_piker/index.dart';

class CommonSelectFormItem extends StatelessWidget {
  final String label;
  final List<String>? options;
  final int? value;
  final ValueChanged<int?>? onChange;

  const CommonSelectFormItem({
    Key? key,
    required this.label,
    this.options,
    this.value,
    this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonFormItem(
      label: label,
      contentBuilder: (context) => GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          // 调起piker
          var result = CommonPiker.showPiker(
              context: context, options: options, value: value);
          result.then((selectedValue) {
            if (value != selectedValue &&
                selectedValue != null &&
                onChange != null) {
              onChange!(selectedValue);
            }
          });
        },
        child: SizedBox(
          height: 40.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                options![value!],
                style: TextStyle(fontSize: 16.0),
              ),
              const Icon(Icons.keyboard_arrow_right),
            ],
          ),
        ),
      ),
    );
  }
}
