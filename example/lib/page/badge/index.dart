import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:voo/color/index.dart';
import 'package:voo/voo.dart';

import '../../comm/ui_component.dart';

///微标视图
class BadgePage extends StatelessWidget {
  //微标-item
  Widget badgeItemView(
      {String title,
      VooBadgeTheme theme = VooBadgeTheme.point,
      String number}) {
    List<Widget> children = [];
    children.add(VooBadgeView(
      child: Icon(Icons.mail_outline, size: 48),
      number: number,
      theme: theme,
      right: 0,
    ));
    children.add(Text(title, style: TextStyle(color: Colors.blue)));
    return Column(children: children);
  }

  //内容
  Widget contentView() {
    List<Widget> children = [];
    children.add(UiComponent.getListTile(title: '基础样式'));

    children.add(Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        badgeItemView(title: '红点提醒', theme: VooBadgeTheme.point),
        badgeItemView(title: '数字提醒', theme: VooBadgeTheme.number, number: '8'),
        badgeItemView(title: '文字提示', theme: VooBadgeTheme.number, number: '99+')
      ],
    ));

    children.add(UiComponent.getListTile(title: '其他样式'));
    children.add(VooCell(
      leading: Padding(
        padding: EdgeInsets.only(right: 8),
        child: Icon(
          Icons.settings,
          size: 18,
          color: VooColors.subTitleColor,
        ),
      ),
      title: '我看过的',
    ));
    children.add(Divider(height: 1));
    children.add(VooCellExtension(
      leading: Icon(Icons.message, size: 18, color: VooColors.subTitleColor),
      title: '我的消息',
      content: VooBadge(
        child: '10',
        theme: VooBadgeTheme.number,
      ),
    ));
    children.add(Divider(height: 1));
    children.add(VooCell(
      leading: Icon(
        Icons.feedback,
        size: 18,
        color: VooColors.subTitleColor,
      ),
      title: '意见反馈',
      content:'5.3.7',
    ));
    return SingleChildScrollView(
      padding: EdgeInsets.only(bottom: 32),
      child: Column(children: children),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UiComponent.getTitleBar(title: 'BadgePreview'),
      body: contentView(),
    );
  }
}
