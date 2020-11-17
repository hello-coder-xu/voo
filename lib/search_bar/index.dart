import 'package:flutter/material.dart';

///搜索栏
class VooSearchBar extends StatelessWidget {
  final Widget leading;
  final Widget child;
  final Widget trailing;
  final Widget contentIcon;
  final Color bgColor;
  final Color roundBgColor;

  VooSearchBar({
    this.leading,
    @required this.child,
    this.contentIcon,
    this.trailing,
    this.bgColor,
    this.roundBgColor,
  });

  //中间视图
  Widget contentView() {
    List<Widget> children = [];
    if (contentIcon != null) {
      children.add(contentIcon);
    } else {
      children.add(Icon(Icons.search, color: Colors.grey));
    }

    children.add(Expanded(
      child: Padding(
        padding: EdgeInsets.only(left: 8),
        child: child,
      ),
    ));

    return Container(
      height: 40,
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: roundBgColor ?? Colors.grey[100],
      ),
      child: Row(children: children, mainAxisSize: MainAxisSize.min),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];
    if (leading != null) {
      children.add(Container(
        constraints: BoxConstraints(minHeight: 56),
        margin: EdgeInsets.only(right: 8),
        child: leading,
        alignment: Alignment.center,
      ));
    }

    children.add(Expanded(child: contentView()));

    if (trailing != null) {
      children.add(Container(
        height: 56,
        margin: EdgeInsets.only(left: 8),
        child: trailing,
        alignment: Alignment.center,
      ));
    }

    return Container(
      height: 56,
      padding: EdgeInsets.symmetric(horizontal: 16),
      alignment: Alignment.center,
      color: bgColor ?? Colors.white,
      child: Row(children: children, crossAxisAlignment: CrossAxisAlignment.center),
    );
  }
}
