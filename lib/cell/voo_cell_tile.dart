import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///单元-tile
class VooCellTile extends StatelessWidget {
  final Widget image;
  final String title;
  final TextStyle style;
  final String subTitle;
  final TextStyle subStyle;
  final double paddingWidth;
  final VoidCallback onTap;

  VooCellTile({
    this.image,
    this.title = '',
    this.style,
    this.subTitle = '',
    this.subStyle,
    this.paddingWidth,
    this.onTap,
  });

  ///左边视图
  Widget leftView() {
    return Container(
      constraints: BoxConstraints(
        maxHeight: ScreenUtil().setHeight(80),
        maxWidth: ScreenUtil().setHeight(80),
      ),
      alignment: Alignment.center,
      child: image,
    );
  }

  ///右边视图
  Widget rightView() {
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
    children.add(SizedBox(height: ScreenUtil().setHeight(8)));
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

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];
    if (image != null) {
      children.add(leftView());
      children.add(SizedBox(width: paddingWidth ?? ScreenUtil().setWidth(24)));
    }
    children.add(Expanded(child: rightView()));
    Widget child = Container(
      constraints: BoxConstraints(minHeight: ScreenUtil().setHeight(136)),
      color: Colors.white,
      padding: EdgeInsets.symmetric(
        horizontal: ScreenUtil().setWidth(32),
        vertical: ScreenUtil().setHeight(28),
      ),
      child: Row(children: children,mainAxisAlignment: MainAxisAlignment.center),
    );
    if (onTap != null) {
      child = GestureDetector(onTap: onTap, child: child);
    }
    return child;
  }
}
