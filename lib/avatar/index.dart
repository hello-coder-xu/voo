import 'package:flutter/material.dart';
import 'package:voo/color/index.dart';

enum VooAvatarTheme { mini, small, normal, large }

///头像
class VooAvatar extends StatelessWidget {
  final VooAvatarTheme theme;
  final Widget icon;
  final String title;
  final String subTitle;

  VooAvatar({this.theme = VooAvatarTheme.mini, this.icon, this.title, this.subTitle});

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
        child: Text(title, style: TextStyle(color: VooColors.titleColor, fontSize: getFontSize())),
      ),
    ));

    if (subTitle != null) {
      children.add(Expanded(
        child: Container(
          alignment: Alignment.centerLeft,
          child: Text(subTitle, style: TextStyle(color: VooColors.subTitleColor, fontSize: getFontSize() - 2)),
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
    double size = 40;
    switch (theme) {
      case VooAvatarTheme.mini:
        size = 24;
        break;
      case VooAvatarTheme.small:
        size = 32;
        break;
      case VooAvatarTheme.normal:
        size = 48;
        break;
      case VooAvatarTheme.large:
        size = 60;
        break;
    }
    return size;
  }

  double getFontSize() {
    double size = 12;
    switch (theme) {
      case VooAvatarTheme.mini:
        size = 12;
        break;
      case VooAvatarTheme.small:
        size = 14;
        break;
      case VooAvatarTheme.normal:
        size = 16;
        break;
      case VooAvatarTheme.large:
        size = 18;
        break;
    }
    return size;
  }
}
