import 'package:flutter/material.dart';
import 'package:voo/badge/index.dart';

///微标+视图
class VooBadgeView extends StatelessWidget {
  //被加微标的视图
  final Widget child;

  //微标内容
  final String? number;

  //微标字体样式
  final TextStyle? textStyle;

  //微标显示模式
  final VooBadgeStyle? style;

  //微标背景颜色
  final Color? bgColor;

  //微标显示位置
  final double? left;
  final double? top;
  final double? right;
  final double? bottom;

  VooBadgeView({
    required this.child,
    this.number,
    this.style,
    this.textStyle,
    this.bgColor,
    this.left,
    this.top,
    this.right,
    this.bottom,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];
    children.add(child);
    children.add(Positioned(
      left: left,
      right: right,
      top: top,
      bottom: bottom,
      child: VooBadge(
        child: number,
        style: style,
        textStyle: textStyle,
        bgColor: bgColor,
      ),
    ));
    return Stack(children: children);
  }
}
