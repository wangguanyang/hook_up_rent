import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class ScopedModelHelper {
  // 泛型方法
  static T getModel<T extends Model>(BuildContext context) {
    return ScopedModel.of<T>(context, rebuildOnChange: true);
  }
}
