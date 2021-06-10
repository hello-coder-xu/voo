import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum VooAvatarTheme { mini, small, normal, large }

///头像
class VooAvatar extends StatelessWidget {
  final VooAvatarTheme theme;
  final Widget icon;
  final String title;
  final String subTitle;

  VooAvatar({this.theme = VooAvatarTheme.mini, this.icon, this.title = '', this.subTitle});

  ///图标
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
          title,
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
            subTitle,
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

  double getSize() {
    double size = 80.w;
    switch (theme) {
      case VooAvatarTheme.mini:
        size = 32.w;
        break;
      case VooAvatarTheme.small:
        size = 64.w;
        break;
      case VooAvatarTheme.normal:
        size = 80.w;
        break;
      case VooAvatarTheme.large:
        size = 96.w;
        break;
    }
    return size;
  }

  double getFontSize() {
    double size = 40.sp;
    switch (theme) {
      case VooAvatarTheme.mini:
        size = 22.sp;
        break;
      case VooAvatarTheme.small:
        size = 28.sp;
        break;
      case VooAvatarTheme.normal:
        size = 32.sp;
        break;
      case VooAvatarTheme.large:
        size = 40.sp;
        break;
    }
    return size;
  }

  double getSubTitleFontSize() {
    double size = 32.sp;
    switch (theme) {
      case VooAvatarTheme.mini:
        size = 14.sp;
        break;
      case VooAvatarTheme.small:
        size = 20.sp;
        break;
      case VooAvatarTheme.normal:
        size = 24.sp;
        break;
      case VooAvatarTheme.large:
        size = 28.sp;
        break;
    }
    return size;
  }
}
