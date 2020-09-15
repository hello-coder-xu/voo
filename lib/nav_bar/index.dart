import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../voo.dart';

///导航栏
class VooNavBar extends StatelessWidget {
  final String title;
  final String subTitle;
  final Icon titleIconLeft;
  final Icon titleIconRight;
  final List<Widget> actions;
  final double elevation;
  final Color backgroundColor;

  VooNavBar({
    this.title = '',
    this.subTitle,
    this.titleIconLeft,
    this.titleIconRight,
    this.actions,
    this.elevation = 0,
    this.backgroundColor,
  });

  //标题视图-文案
  Widget titleTextView(BuildContext context) {
    List<Widget> children = [];
    children.add(Text(title, style: TextStyle(fontSize: 18)));
    if (subTitle != null) {
      children.add(Text(subTitle, style: TextStyle(fontSize: 14, color: VooColors.subTitleColor)));
    }
    return Column(children: children, mainAxisSize: MainAxisSize.min);
  }

  //标题视图
  Widget titleView(BuildContext context) {
    List<Widget> children = [];
    if (titleIconLeft != null) {
      children.add(titleIconLeft);
      children.add(SizedBox(width: 4));
    }
    children.add(titleTextView(context));

    if (titleIconRight != null) {
      children.add(SizedBox(width: 4));
      children.add(titleIconRight);
    }
    return Row(
      children: children,
      mainAxisSize: MainAxisSize.min,
    );
  }

  //actions视图
  List<Widget> actionsView() {
    List<Widget> children = actions;
    if (children != null) {
      children.add(SizedBox(width: 16));
    }
    return children;
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: titleView(context),
      centerTitle: true,
      backgroundColor: backgroundColor ?? AppBarTheme.of(context).color,
      leading: Icon(VooIcon.arrow_left),
      elevation: elevation,
      actions: actionsView(),
    );
  }
}
