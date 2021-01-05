import '../../comm/ui_component.dart';
import 'package:flutter/material.dart';
import 'package:voo/voo.dart';

///验证码输入框
class CodeCellPage extends StatelessWidget {
  //内容
  Widget contentView() {
    List<Widget> children = [];

    children.add(UiComponent.getListTile(title: '基础用法'));

    children.add(VooCellField(
      leading: Text('*', style: TextStyle(color: Colors.red)),
      title: Text('手机号', style: TextStyle(fontSize: 16)),
      child: VooField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: '输入手机号',
        ),
      ),
      trailing: Text('发送', style: TextStyle(color: Colors.green)),
    ));

    children.add(Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 32),
      child: VooButton(
        child: '允许手机通过',
        theme: VooButtonTheme.capsule,
        onPressed: () {},
      ),
    ));

    return SingleChildScrollView(
      child: Column(children: children),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UiComponent.getTitleBar(title: 'CodeCellPreView'),
      body: contentView(),
    );
  }
}
