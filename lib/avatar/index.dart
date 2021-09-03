import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//迷你  小  普通  大
enum VooAvatarStyle { mini, small, normal, large }

///头像
class VooAvatar extends StatelessWidget {
  //显示样式
  final VooAvatarStyle style;

  //头像
  final Widget? icon;

  //标题
  final String? title;

  //副标题
  final String? subTitle;

  VooAvatar({
    this.style = VooAvatarStyle.mini,
    this.icon,
    this.title,
    this.subTitle,
  });

  ///头像视图
  Widget iconView() {
    return Container(
      height: getSize(),
      width: getSize(),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(getSize() / 2),
        child: icon,
      ),
    );
  }

  ///文字内容
  Widget contentView() {
    List<Widget> children = [];
    children.add(Expanded(
      child: Container(
        alignment: Alignment.centerLeft,
        child: Text(
          title ?? "",
          style: TextStyle(
            color: Color(0xff333333),
            fontSize: getFontSize(),
          ),
        ),
      ),
    ));

    if (subTitle != null) {
      children.add(Expanded(
        child: Container(
          alignment: Alignment.centerLeft,
          child: Text(
            subTitle!,
            style: TextStyle(
              color: Color(0xff999999),
              fontSize: getSubTitleFontSize(),
            ),
          ),
        ),
      ));
    }
    return Container(
      width: double.infinity,
      height: getSize(),
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: Column(children: children),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget child;
    if (title == null) {
      child = iconView();
    } else {
      List<Widget> children = [];
      children.add(iconView());
      children.add(Expanded(child: contentView()));
      child = Row(children: children);
    }

    return Container(
      width: double.infinity,
      height: getSize(),
      alignment: Alignment.centerLeft,
      child: child,
    );
  }

  //样式
  double getSize() {
    double size = 80.w;
    switch (style) {
      case VooAvatarStyle.mini:
        size = 32.w;
        break;
      case VooAvatarStyle.small:
        size = 64.w;
        break;
      case VooAvatarStyle.normal:
        size = 80.w;
        break;
      case VooAvatarStyle.large:
        size = 96.w;
        break;
    }
    return size;
  }

  //标题字体大小
  double getFontSize() {
    double size = 40.sp;
    switch (style) {
      case VooAvatarStyle.mini:
        size = 22.sp;
        break;
      case VooAvatarStyle.small:
        size = 28.sp;
        break;
      case VooAvatarStyle.normal:
        size = 32.sp;
        break;
      case VooAvatarStyle.large:
        size = 40.sp;
        break;
    }
    return size;
  }

  //副标题大小
  double getSubTitleFontSize() {
    double size = 32.sp;
    switch (style) {
      case VooAvatarStyle.mini:
        size = 14.sp;
        break;
      case VooAvatarStyle.small:
        size = 20.sp;
        break;
      case VooAvatarStyle.normal:
        size = 24.sp;
        break;
      case VooAvatarStyle.large:
        size = 28.sp;
        break;
    }
    return size;
  }
}
