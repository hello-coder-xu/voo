import 'package:example/comm/ui_component.dart';
import 'package:flutter/material.dart';
import 'package:voo/cell/index.dart';
import 'package:voo/color/index.dart';
import 'package:voo/icon/index.dart';
import 'package:voo/voo.dart';

///微标视图
class BadgePage extends StatelessWidget {
  //微标-item
  Widget badgeItemView({String title, Widget badge}) {
    List<Widget> children = [];
    children.add(Stack(
      children: [
        Icon(Icons.mail_outline, size: 48),
        Positioned(
          right: 0,
          child: badge,
        ),
      ],
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
        badgeItemView(title: '红点提醒', badge: VooBadge()),
        badgeItemView(title: '数字提醒', badge: VooBadge(isPoint: false, child: 9)),
        badgeItemView(title: '文字提示', badge: VooBadge(isPoint: false, child: 'new'))
      ],
    ));

    children.add(UiComponent.getListTile(title: '其他样式'));
    children.add(VooCell(
      leading: Padding(
        padding: EdgeInsets.only(right: 8),
        child: Icon(Icons.settings, size: 18, color: VooColors.subTitleColor),
      ),
      title: Text('我看过的'),
      trailing: Icon(VooIcon.arrow_right, size: 16, color: VooColors.subTitleColor),
    ));
    children.add(Divider(height: 1));
    children.add(VooCell(
      leading: Padding(
        padding: EdgeInsets.only(right: 8),
        child: Icon(Icons.message, size: 18, color: VooColors.subTitleColor),
      ),
      title: Text('我的消息'),
      value: VooBadge(
        child: '10',
        isPoint: false,
      ),
      trailing: Icon(VooIcon.arrow_right, size: 16, color: VooColors.subTitleColor),
    ));
    children.add(Divider(height: 1));
    children.add(VooCell(
      leading: Padding(
        padding: EdgeInsets.only(right: 8),
        child: Icon(Icons.feedback, size: 18, color: VooColors.subTitleColor),
      ),
      title: Text('意见反馈'),
      value: Text('5.3.7', style: TextStyle(fontSize: 14, color: Colors.grey)),
      trailing: Icon(VooIcon.arrow_right, size: 16, color: VooColors.subTitleColor),
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