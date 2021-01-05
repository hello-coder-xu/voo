import 'package:voo/button/index.dart';
import 'package:voo/cell/voo_cell_field.dart';
import 'package:voo/field/index.dart';

import '../../comm/ui_component.dart';
import 'package:flutter/material.dart';


///密码输入框
class PasswordCellPage extends StatelessWidget {
  //内容
  Widget contentView() {
    List<Widget> children = [];

    children.add(UiComponent.getListTile(title: '基础用法'));

    children.add(VooCellField(
      leading: Text('*', style: TextStyle(color: Colors.red)),
      title: Text('密码', style: TextStyle(fontSize: 16)),
      child: VooField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: '输入密码',
        ),
        showPwd: true,
      ),
    ));

    children.add(Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 32),
      child: VooButton(
        child: '获取值',
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
      appBar: UiComponent.getTitleBar(title: 'PasswordCellPreView'),
      body: contentView(),
    );
  }
}
