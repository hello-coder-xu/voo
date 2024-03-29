import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../voo.dart';

///导航栏
class VooNavBar extends StatelessWidget {
  //标题
  final String title;
  //副标题
  final String? subTitle;
  //标题字体样式
  final TextStyle? style;
  //副标题字体样式
  final TextStyle? subStyle;
  //左边icon
  final Icon? titleIconLeft;
  //右边icon
  final Icon? titleIconRight;
  //更多
  final List<Widget>? actions;
  //阴影
  final double elevation;
  //背景颜色
  final Color? backgroundColor;

  VooNavBar({
    this.title = '',
    this.subTitle,
    this.style,
    this.subStyle,
    this.titleIconLeft,
    this.titleIconRight,
    this.actions,
    this.elevation = 0,
    this.backgroundColor,
  });

  //标题视图-文案
  Widget titleTextView(BuildContext context) {
    List<Widget> children = [];
    children.add(Text(
      title,
      style: style ??
          TextStyle(
            fontSize: 36.sp,
            color: Color(0xff333333),
          ),
    ));
    if (subTitle != null) {
      children.add(Text(
        subTitle!,
        style: subStyle ??
            TextStyle(
              fontSize: 24.sp,
              color: Color(0xff333333),
            ),
      ));
    }
    return Column(children: children, mainAxisSize: MainAxisSize.min);
  }

  //标题视图
  Widget titleView(BuildContext context) {
    List<Widget?> children = [];
    if (titleIconLeft != null) {
      children.add(titleIconLeft);
      children.add(SizedBox(width: 14.w));
    }
    children.add(titleTextView(context));

    if (titleIconRight != null) {
      children.add(SizedBox(width: 14.w));
      children.add(titleIconRight);
    }
    return Row(
      children: children as List<Widget>,
      mainAxisSize: MainAxisSize.min,
    );
  }

  //actions视图
  List<Widget>? actionsView() {
    List<Widget>? children = actions;
    if (children != null) {
      children.add(SizedBox(width: 32.w));
    }
    return children;
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: titleView(context),
      centerTitle: true,
      backgroundColor: backgroundColor ?? Colors.white,
      leading: Icon(VooIcon.arrow_left),
      elevation: elevation,
      actions: actionsView(),
    );
  }
}
