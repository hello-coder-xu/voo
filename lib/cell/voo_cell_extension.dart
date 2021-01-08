import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

///单元格
class VooCellExtension extends StatelessWidget {
  final String title;
  final TextStyle style;
  final Widget leading;
  final Widget trailing;
  final Widget content;
  final bool showRightIcon;
  final VoidCallback onTap;

  VooCellExtension({
    this.title = '',
    this.style,
    this.leading,
    this.trailing,
    this.content,
    this.showRightIcon=true,
    this.onTap,
  });

  ///前面视图
  Widget leadingView() {
    Widget titleView = Text(
      title,
      style: style ??
          TextStyle(
            fontSize: ScreenUtil().setSp(32),
            color: Color(0xff333333),
          ),
    );

    if (leading != null) {
      List<Widget> children = [];
      children.add(leading);
      children.add(SizedBox(width: ScreenUtil().setWidth(24)));
      children.add(titleView);
      return Row(children: children);
    }
    return titleView;
  }

  ///后面视图
  Widget trailingView() {
    Widget valueView = DefaultTextStyle(
      style: TextStyle(fontSize: ScreenUtil().setSp(32), color: Color(0xffb6b6b6)),
      child: content ?? Text(''),
    );
    List<Widget> children = [];
    children.add(valueView);
    if (trailing != null) {
      children.add(SizedBox(width: ScreenUtil().setWidth(32)));
      children.add(trailing);
    }else if(showRightIcon){
      children.add(SizedBox(width: ScreenUtil().setWidth(16)));
      children.add(Icon(
        Icons.keyboard_arrow_right,
        size: ScreenUtil().setWidth(40),
        color: Color(0xffb6b6b6),
      ));
    }
    return Row(
      children: children,
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];
    children.add(leadingView());
    children.add(Expanded(
      child: Container(
        alignment: Alignment.centerRight,
        child: trailingView(),
      ),
    ));
    Widget child = Container(
      constraints: BoxConstraints(minHeight: ScreenUtil().setHeight(100)),
      color: Colors.white,
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(32)),
      child: Row(
        children: children,
        crossAxisAlignment: CrossAxisAlignment.center,
      ),
    );

    if (onTap != null) {
      child = GestureDetector(onTap: onTap, child: child);
    }
    return child;
  }
}
