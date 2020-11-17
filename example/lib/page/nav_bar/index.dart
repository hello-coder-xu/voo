import '../../comm/ui_component.dart';
import 'package:flutter/material.dart';
import 'package:voo/color/index.dart';
import 'package:voo/icon/index.dart';
import 'package:voo/nav_bar/index.dart';

///导航样式
class NavBarPage extends StatelessWidget {
  ///内容视图
  Widget contentView() {
    List<Widget> children = [];
    children.add(UiComponent.getListTile(title: '基础用法'));
    children.add(VooNavBar(
      title: '标题',
      actions: [
        Container(
          child: Text('按钮'),
          alignment: Alignment.center,
        ),
      ],
    ));
    children.add(UiComponent.getListTile(title: '副标题'));
    children.add(VooNavBar(
      title: '标题',
      subTitle: '副标题',
      actions: [
        Container(
          child: Text('按钮'),
          alignment: Alignment.center,
        ),
      ],
    ));
    children.add(UiComponent.getListTile(title: '使用插槽(左)'));
    children.add(VooNavBar(
      title: '标题',
      titleIconLeft: Icon(VooIcon.fire, size: 16),
      actions: [
        Container(
          child: Icon(VooIcon.search),
          alignment: Alignment.center,
        ),
      ],
    ));
    children.add(UiComponent.getListTile(title: '使用插槽(右)'));
    children.add(VooNavBar(
      title: '标题',
      titleIconRight: Icon(VooIcon.fire, size: 16),
      actions: [
        Container(
          child: Icon(VooIcon.search),
          margin: EdgeInsets.only(right: 16),
          alignment: Alignment.center,
        ),
        Container(
          child: Icon(VooIcon.avatar),
          alignment: Alignment.center,
        ),
      ],
    ));
    children.add(UiComponent.getListTile(title: '自定义背景色'));
    children.add(VooNavBar(
      title: '标题',
      backgroundColor: VooColors.accentColor,
      actions: [
        Container(
          child: Text('按钮'),
          alignment: Alignment.center,
        ),
      ],
    ));
    return SingleChildScrollView(child: Column(children: children));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UiComponent.getTitleBar(title: 'NavBarPreview'),
      body: contentView(),
    );
  }
}
