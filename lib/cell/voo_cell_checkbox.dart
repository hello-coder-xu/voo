import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

///单元-单选择
class VooCellCheckBox extends StatelessWidget {
  final String title;
  final TextStyle style;
  final Widget leading;
  final bool checked;
  final Widget checkView;
  final VoidCallback onTap;

  VooCellCheckBox({
    this.title = '',
    this.style,
    this.leading,
    this.checked = false,
    this.checkView,
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
      return Row(
          children: children, crossAxisAlignment: CrossAxisAlignment.center);
    }
    return titleView;
  }

  ///后面视图
  Widget trailingView() {
    return checkView ??
        Icon(
          Icons.check,
          size: ScreenUtil().setWidth(48),
          color: Color(0xff25c489),
        );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];
    children.add(leadingView());
    if (checked) {
      children.add(Expanded(
        child: Container(
          alignment: Alignment.centerRight,
          child: trailingView(),
        ),
      ));
    }
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
