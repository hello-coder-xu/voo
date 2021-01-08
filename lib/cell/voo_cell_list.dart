import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

///单元格-list
class VooCellList extends StatelessWidget {
  final String title;
  final TextStyle style;
  final String subTitle;
  final TextStyle subStyle;
  final Widget image;
  final double paddingWidth;
  final VoidCallback onTap;

  VooCellList({
    this.title,
    this.style,
    this.subTitle,
    this.subStyle,
    this.image,
    this.paddingWidth,
    this.onTap,
  });

  ///左边视图
  Widget leftView() {
    List<Widget> children = [];
    children.add(Container(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: style ??
            TextStyle(
              fontSize: ScreenUtil().setSp(32),
              color: Color(0xff333333),
            ),
      ),
    ));
    children.add(SizedBox(height: ScreenUtil().setHeight(48)));
    children.add(Container(
      alignment: Alignment.centerLeft,
      child: Text(
        subTitle,
        style: subStyle ??
            TextStyle(
              fontSize: ScreenUtil().setSp(24),
              color: Color(0xff999999),
            ),
      ),
    ));
    return Column(children: children);
  }

  ///右边视图
  Widget rightView() {
    return Container(
      width: ScreenUtil().setHeight(288),
      height: ScreenUtil().setHeight(162),
      alignment: Alignment.center,
      child: image,
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];
    children.add(Expanded(child: leftView()));
    if (image != null) {
      children.add(SizedBox(width: paddingWidth ?? ScreenUtil().setWidth(46)));
      children.add(rightView());
    }
    Widget child = Container(
      constraints: BoxConstraints(minHeight: ScreenUtil().setHeight(234)),
      color: Colors.white,
      padding: EdgeInsets.symmetric(
        horizontal: ScreenUtil().setWidth(32),
        vertical: ScreenUtil().setHeight(28),
      ),
      child:
          Row(children: children, mainAxisAlignment: MainAxisAlignment.center),
    );
    if (onTap != null) {
      child = GestureDetector(onTap: onTap, child: child);
    }
    return child;
  }
}
