import 'package:flutter/material.dart';

class VooCollapseBean {
  bool initiallyExpanded;
  Text title;
  Widget child;

  VooCollapseBean({this.initiallyExpanded = false, @required this.title, @required this.child})
      : assert(title != null),
        assert(child != null);
}
