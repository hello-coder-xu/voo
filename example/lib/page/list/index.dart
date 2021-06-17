import '../../comm/ui_component.dart';
import 'package:flutter/material.dart';
import 'package:voo/cell/index.dart';
import 'package:voo/cell/voo_cell_field.dart';
import 'package:voo/color/index.dart';
import 'package:voo/voo.dart';

///列表页面
class ListPage extends StatelessWidget {
  //内容
  Widget contentView() {
    List<Widget> children = [];

    children.add(SizedBox(height: 32));
    children.add(VooCellField(
      title: '昵称',
      textAlign: TextAlign.left,
      hintText: '请输入昵称',
    ));
    children.add(Divider(height: 1));
    children.add(VooCellField(
      title: '密码',
      showPwd: true,
      textAlign: TextAlign.left,
      hintText: '请输入密码',
    ));

    children.add(SizedBox(height: 32));
    children.add(VooCell(
      title: '意见反馈',
    ));
    children.add(Divider(height: 1));
    children.add(VooCell(
      title: '通用',
    ));

    children.add(SizedBox(height: 32));
    children.add(VooCell(
      leading: Icon(Icons.settings, size: 18, color: VooColors.subTitleColor),
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
      leading: Icon(Icons.feedback, size: 18, color: VooColors.subTitleColor),
      title: '意见反馈',
      content: '5.3.7',
    ));

    children.add(SizedBox(height: 32));
    children.add(VooCellTile(
      image: Image.asset('assets/icon/100.png'),
      title: '蕴意室内设计',
      subTitle: '浏览数1W',
    ));
    children.add(Divider(height: 1));
    children.add(VooCellTile(
      image: Image.asset('assets/icon/100.png'),
      title: '好室佳室内设计',
      subTitle: '浏览数8.7k',
    ));

    children.add(SizedBox(height: 32));
    children.add(VooCellList(
      image: Container(color: Colors.grey),
      title: '这十种室内香水，搞定睡的香又甜',
      subTitle: '浏览数：1w   点赞数：1w',
    ));
    children.add(Divider(height: 1));
    children.add(VooCellList(
      image: Container(color: Colors.grey),
      title: '有套漂亮床单，卧室变美不是问题',
      subTitle: '浏览数：8.5k',
    ));
    return SingleChildScrollView(
      padding: EdgeInsets.only(bottom: 32),
      child: Column(children: children),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UiComponent.getTitleBar(title: 'ListPreview'),
      body: contentView(),
    );
  }
}
