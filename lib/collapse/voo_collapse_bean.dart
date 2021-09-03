import 'package:flutter/material.dart';

class VooCollapseBean {
  //是否展开
  bool initiallyExpanded;

  //标题
  Text title;

  //内容
  Widget child;

  VooCollapseBean({this.initiallyExpanded = false, required this.title, required this.child})
      : assert(title != null),
        assert(child != null);
}
