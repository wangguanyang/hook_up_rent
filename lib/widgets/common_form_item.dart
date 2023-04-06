import 'package:flutter/material.dart';

class CommonFormItem extends StatelessWidget {
  final String? label;
  final Widget Function(BuildContext context)? contentBuilder;
  final Widget? suffix;
  final String? suffixText;
  final String? hintText;
  final ValueChanged? onChanged;
  final TextEditingController? controller;

  const CommonFormItem({
    Key? key,
    this.label,
    this.contentBuilder,
    this.suffix,
    this.suffixText,
    this.hintText,
    this.onChanged,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15.0, right: 15.0),
      decoration: BoxDecoration(
          border: Border(
              bottom:
                  BorderSide(width: 1, color: Theme.of(context).dividerColor))),
      child: Row(
        children: [
          Container(
            width: 100,
            child: Text(
              label ?? '',
              style: TextStyle(color: Colors.black87, fontSize: 16.0),
            ),
          ),
          Expanded(
              child: contentBuilder != null
                  ? contentBuilder!(context)
                  : TextField(
                      controller: controller,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: hintText,
                      ),
                    )),
          if (suffix != null) suffix!,
          if (suffix == null && suffixText != null) Text(suffixText!),
        ],
      ),
    );
  }
}
