import 'package:example/comm/ui_component.dart';
import 'package:flutter/material.dart';
import 'package:voo/button/index.dart';

///按钮页面
class ButtonPage extends StatelessWidget {
  //内容视图
  Widget contentView() {
    List<Widget> children = [];
    children.add(UiComponent.getListTile(title: '按钮展示'));

    children.add(Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: VooButton(
        child: Text('主要操作 Normal'),
        theme: VooButtonTheme.normal,
        onPressed: () {},
      ),
    ));

    children.add(Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: VooButton(
        child: Text('辅助操作 Accent'),
        theme: VooButtonTheme.accent,
        onPressed: () {},
      ),
    ));

    children.add(Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: VooButton(
        child: Text('胶囊按钮'),
        theme: VooButtonTheme.capsule,
        onPressed: () {},
      ),
    ));

    children.add(Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: VooButton(
        child: Text('文字按钮'),
        theme: VooButtonTheme.text,
        onPressed: () {},
      ),
    ));

    children.add(UiComponent.getListTile(title: '不可点击'));

    children.add(Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: VooButton(
        child: Text('主要操作 Normal'),
        theme: VooButtonTheme.normal,
      ),
    ));

    children.add(Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: VooButton(
        child: Text('辅助操作 Accent'),
        theme: VooButtonTheme.accent,
      ),
    ));

    children.add(Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: VooButton(
        child: Text('胶囊按钮'),
        theme: VooButtonTheme.capsule,
      ),
    ));

    children.add(Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: VooButton(
        child: Text('文字按钮'),
        theme: VooButtonTheme.text,
      ),
    ));

    return SingleChildScrollView(
      child: Column(children: children),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UiComponent.getTitleBar(title: 'ButtonPreview'),
      body: contentView(),
    );
  }
}
