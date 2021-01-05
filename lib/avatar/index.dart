import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

enum VooAvatarTheme { mini, small, normal, large }

///头像
class VooAvatar extends StatelessWidget {
  final VooAvatarTheme theme;
  final Widget icon;
  final String title;
  final String subTitle;

  VooAvatar(
      {this.theme = VooAvatarTheme.mini,
      this.icon,
      this.title = '',
      this.subTitle});

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
    double size = ScreenUtil().setWidth(80);
    switch (theme) {
      case VooAvatarTheme.mini:
        size = ScreenUtil().setWidth(32);
        break;
      case VooAvatarTheme.small:
        size = ScreenUtil().setWidth(64);
        break;
      case VooAvatarTheme.normal:
        size = ScreenUtil().setWidth(80);
        break;
      case VooAvatarTheme.large:
        size = ScreenUtil().setWidth(96);
        break;
    }
    return size;
  }

  double getFontSize() {
    double size = ScreenUtil().setSp(40);
    switch (theme) {
      case VooAvatarTheme.mini:
        size = ScreenUtil().setSp(16);
        break;
      case VooAvatarTheme.small:
        size = ScreenUtil().setSp(32);
        break;
      case VooAvatarTheme.normal:
        size = ScreenUtil().setSp(40);
        break;
      case VooAvatarTheme.large:
        size = ScreenUtil().setSp(48);
        break;
    }
    return size;
  }

  double getSubTitleFontSize() {
    double size = getFontSize();
    return size - ScreenUtil().setSp(12);
  }
}
