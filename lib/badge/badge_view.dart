import 'package:flutter/material.dart';
import 'package:voo/badge/index.dart';

///微标+视图
class VooBadgeView extends StatelessWidget {
  final Widget child;
  final String number;
  final TextStyle style;
  final VooBadgeTheme theme;
  final Color bgColor;
  final double left;
  final double top;
  final double right;
  final double bottom;

  VooBadgeView({
    this.child,
    this.number,
    this.theme,
    this.style,
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
        theme: theme,
        style: style,
        bgColor: bgColor,
      ),
    ));
    return Stack(children: children);
  }
}
