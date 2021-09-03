import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///单元-tile
class VooCellTile extends StatelessWidget {
  final Widget? image;
  final String title;
  final TextStyle? style;
  final String subTitle;
  final TextStyle? subStyle;
  final double? paddingWidth;
  final VoidCallback? onTap;

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
        maxHeight: 80.h,
        maxWidth: 80.h,
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
              fontSize: 32.sp,
              color: Color(0xff333333),
            ),
      ),
    ));
    children.add(SizedBox(height: 8.h));
    children.add(Container(
      alignment: Alignment.centerLeft,
      child: Text(
        subTitle,
        style: subStyle ??
            TextStyle(
              fontSize: 24.sp,
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
      children.add(SizedBox(width: paddingWidth ?? 24.w));
    }
    children.add(Expanded(child: rightView()));
    Widget child = Container(
      constraints: BoxConstraints(minHeight: 136.h),
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
