import 'package:example/comm/ui_component.dart';
import 'package:flutter/material.dart';
import 'package:voo/voo.dart';

///异常页面
class ErrorPage extends StatelessWidget {
  //内容视图
  Widget contentView() {
    List<Widget> children = [];
    children.add(UiComponent.getListTile(title: '网络异常'));
    children.add(VooError(type: VooErrorType.net_error));
    children.add(UiComponent.getListTile(title: '暂无数据'));
    children.add(VooError(type: VooErrorType.empty_data));
    children.add(UiComponent.getListTile(title: '暂无评论'));
    children.add(VooError(type: VooErrorType.empty_comment));
    children.add(UiComponent.getListTile(title: '系统错误'));
    children.add(VooError(type: VooErrorType.sys_error));
    return SingleChildScrollView(child: Column(children: children));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UiComponent.getTitleBar(title: 'ErrorPagePreview'),
      body: contentView(),
    );
  }
}
