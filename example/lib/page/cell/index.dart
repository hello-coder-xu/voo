import 'package:voo/cell/index.dart';
import 'package:voo/color/index.dart';
import 'package:voo/icon/index.dart';
import 'package:voo/toast/index.dart';

import '../../comm/ui_component.dart';
import 'package:flutter/material.dart';


///单元格
class CellPage extends StatelessWidget {
  //内容视图
  Widget contentView(BuildContext context) {
    List<Widget> children = [];
    children.add(UiComponent.getListTile(title: '基础用法'));
    children.add(VooCell(
      title: Text('单元格'),
      value: Text('内容'),
    ));
    children.add(Divider(height: 1));
    children.add(VooCell(
      title: Text('单元格'),
      value: Text('内容'),
      subTitle: Text('描述信息'),
    ));

    children.add(UiComponent.getListTile(title: '单元格大小'));
    children.add(VooCell(
      title: Text('单元格', style: TextStyle(fontSize: 16)),
      value: Text('内容'),
    ));
    children.add(Divider(height: 1));
    children.add(VooCell(
      title: Text('单元格', style: TextStyle(fontSize: 16)),
      value: Text('内容'),
      subTitle: Text('描述信息'),
    ));

    children.add(UiComponent.getListTile(title: '展示图标'));
    children.add(VooCell(
      leading: Icon(Icons.location_on, size: 18),
      title: Text('单元格'),
      value: Text('内容'),
    ));

    children.add(UiComponent.getListTile(title: '只设置value'));
    children.add(VooCell(
      title: Text('内容'),
    ));

    children.add(UiComponent.getListTile(title: '展示箭头'));
    children.add(VooCell(
      title: Text('单元格'),
      trailing: Icon(VooIcon.arrow_right, size: 16, color: VooColors.subTitleColor),
    ));
    children.add(Divider(height: 1));
    children.add(VooCell(
      title: Text('单元格'),
      value: Text('内容'),
      trailing: Icon(VooIcon.arrow_right, size: 16, color: VooColors.subTitleColor),
    ));
    children.add(Divider(height: 1));
    children.add(VooCell(
      title: Text('单元格'),
      value: Text('内容'),
      trailing: Icon(VooIcon.arrow_down, size: 16, color: VooColors.subTitleColor),
    ));

    children.add(UiComponent.getListTile(title: '页面导航'));
    children.add(VooCell(
      title: Text('URL 跳转'),
      trailing: Icon(VooIcon.search, size: 16, color: VooColors.subTitleColor),
      onTap: () {
        VooToast.showToast(context, msg: 'URL 跳转点击');
      },
    ));
    children.add(Divider(height: 1));
    children.add(VooCell(
      title: Text('路由跳转'),
      trailing: Icon(VooIcon.arrow_right, size: 16, color: VooColors.subTitleColor),
      onTap: () {
        VooToast.showToast(context, msg: '路由跳转');
      },
    ));

    children.add(UiComponent.getListTile(title: '垂直居中'));
    children.add(VooCell(
      title: Text('单元格', style: TextStyle(fontSize: 16)),
      value: Text('内容'),
      subTitle: Text('描述信息'),
      alignment: CrossAxisAlignment.center,
    ));

    return SingleChildScrollView(child: Column(children: children));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UiComponent.getTitleBar(title: 'CellPreview'),
      body: contentView(context),
    );
  }
}
