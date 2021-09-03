import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///单元格-list
class VooCellList extends StatelessWidget {
  final String? title;
  final TextStyle? style;
  final String? subTitle;
  final TextStyle? subStyle;
  final Widget? image;
  final double? paddingWidth;
  final VoidCallback? onTap;

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
        title!,
        style: style ??
            TextStyle(
              fontSize: 32.sp,
              color: Color(0xff333333),
            ),
      ),
    ));
    children.add(SizedBox(height: 48.h));
    children.add(Container(
      alignment: Alignment.centerLeft,
      child: Text(
        subTitle!,
        style: subStyle ??
            TextStyle(
              fontSize: 24.sp,
              color: Color(0xff999999),
            ),
      ),
    ));
    return Column(children: children);
  }

  ///右边视图
  Widget rightView() {
    return Container(
      width: 288.w,
      height: 162.h,
      alignment: Alignment.center,
      child: image,
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];
    children.add(Expanded(child: leftView()));
    if (image != null) {
      children.add(SizedBox(width: paddingWidth ?? 46.w));
      children.add(rightView());
    }
    Widget child = Container(
      constraints: BoxConstraints(minHeight: 234.h),
      color: Colors.white,
      padding: EdgeInsets.symmetric(
        horizontal: 32.w,
        vertical: 28.h,
      ),
      child: Row(children: children, mainAxisAlignment: MainAxisAlignment.center),
    );
    if (onTap != null) {
      child = GestureDetector(onTap: onTap, child: child);
    }
    return child;
  }
}
