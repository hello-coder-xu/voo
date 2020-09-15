import 'package:flutter/material.dart';
import 'package:voo/color/index.dart';

///单元格
class VooCell extends StatelessWidget {
  final Text title;
  final Text subTitle;
  final Widget leading;
  final Widget trailing;
  final Widget value;
  final CrossAxisAlignment alignment;
  final VoidCallback onTap;

  VooCell({
    this.title,
    this.subTitle,
    this.leading,
    this.trailing,
    this.value,
    this.alignment = CrossAxisAlignment.center,
    this.onTap,
  });

  ///前面视图
  Widget leadingView() {
    Widget titleView = DefaultTextStyle(
      style: TextStyle(fontSize: 14, color: VooColors.titleColor),
      child: title ?? Text(''),
    );

    if (leading != null) {
      List<Widget> children = [];
      children.add(leading);
      children.add(titleView);
      return Row(children: children);
    }
    return titleView;
  }

  ///后面视图
  Widget trailingView() {
    Widget valueView = DefaultTextStyle(
      style: TextStyle(fontSize: 14, color: VooColors.subTitleColor),
      child: value ?? Text(''),
    );
    if (trailing != null) {
      List<Widget> children = [];
      children.add(valueView);
      children.add(SizedBox(width: 4));
      children.add(trailing);
      return Row(
        children: children,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
      );
    }
    return valueView;
  }

  ///描述视图
  Widget describeView() {
    return Container(
      alignment: Alignment.centerLeft,
      child: DefaultTextStyle(
        style: TextStyle(fontSize: 14, color: VooColors.subTitleColor),
        child: subTitle ?? Text(''),
      ),
    );
  }

  ///左边视图
  Widget leftView() {
    Widget child = leadingView();
    if (subTitle != null) {
      List<Widget> children = [];
      children.add(leadingView());
      children.add(SizedBox(height: 4));
      children.add(subTitle);
      child = Column(
        children: children,
        crossAxisAlignment: CrossAxisAlignment.start,
      );
    }
    return child;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];
    children.add(leftView());
    children.add(Expanded(
      child: Container(
        alignment: Alignment.centerRight,
        child: trailingView(),
      ),
    ));
    Widget child = Container(
      constraints: BoxConstraints(minHeight: 48),
      color: Colors.white,
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: children,
        crossAxisAlignment: alignment,
      ),
    );

    if (onTap != null) {
      child = GestureDetector(onTap: onTap, child: child);
    }
    return child;
  }
}
