import '../../comm/ui_component.dart';
import 'package:flutter/material.dart';
import 'package:voo/voo.dart';

///加载页面
class LoadingPage extends StatelessWidget {
  //内容页面
  Widget contentView() {
    List<Widget> children = [];
    children.add(UiComponent.getListTile(title: '加载类型'));
    children.add(Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: VooLoading(),
    ));
    children.add(UiComponent.getListTile(title: '自定义颜色'));
    children.add(Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: VooLoading(color: Colors.red),
    ));
    children.add(UiComponent.getListTile(title: '自定义大小'));
    children.add(Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: VooLoading(size: 20),
    ));
    children.add(UiComponent.getListTile(title: '加载文案'));
    children.add(Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: VooLoading(title: '加载中...'),
    ));
    children.add(UiComponent.getListTile(title: '垂直排列'));
    children.add(Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: VooLoading(title: '加载中...', horizontal: false),
    ));
    return SingleChildScrollView(child: Column(children: children));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UiComponent.getTitleBar(title: 'LoadingPreview'),
      body: contentView(),
    );
  }
}
