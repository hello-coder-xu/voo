import 'package:flutter/material.dart';
import 'package:voo/collapse/voo_collapse.dart';
import 'package:voo/collapse/voo_collapse_bean.dart';

///折叠组
class VooGroupCollapse extends StatefulWidget {
  //内容数组
  final List<VooCollapseBean> children;
  //是否手风琴
  final bool isAccordion;
  //选择变化事件
  final Function(int index, bool expansion)? onExpansionChanged;

  VooGroupCollapse({
    required this.children,
    this.isAccordion = false,
    this.onExpansionChanged,
  }) : assert(children != null);

  @override
  VooGroupCollapseState createState() => VooGroupCollapseState();
}

class VooGroupCollapseState extends State<VooGroupCollapse> {
  List<GlobalKey> keyChildren = [];

  void initState() {
    super.initState();
    List.generate(widget.children.length, (index) => keyChildren.add(GlobalKey()));
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];
    widget.children.forEach((element) {
      if (children.length > 0) {
        children.add(Divider(height: 1, indent: 16, endIndent: 16));
      }
      int tempIndex = widget.children.indexOf(element);
      children.add(VooCollapse(
        initiallyExpanded: element.initiallyExpanded,
        title: element.title.data,
        style: element.title.style,
        child: element.child,
        key: keyChildren[tempIndex],
        onExpansionChanged: (value) => onExpansionChanged(tempIndex, value),
      ));
    });

    return Container(
      color: Colors.white,
      child: Column(children: children),
    );
  }

  void onExpansionChanged(int index, bool expanded) {
    if (widget.onExpansionChanged != null) {
      widget.onExpansionChanged!(index, expanded);
    }
    if (widget.isAccordion) {
      List.generate(widget.children.length, (curIndex) {
        if (index != curIndex) {
          VooCollapseState vooCollapseState = (keyChildren[curIndex].currentState as VooCollapseState);
          if (vooCollapseState.isExpanded) {
            vooCollapseState.notificationByParent(expanded: false);
          }
        }
      });
    }
  }

  @override
  void dispose() {
    keyChildren.clear();
    super.dispose();
  }
}
