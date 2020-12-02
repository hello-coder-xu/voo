import 'dart:async';

import 'package:voo/button/index.dart';
import 'package:voo/toast/index.dart';

import '../../comm/ui_component.dart';
import 'package:flutter/material.dart';

///轻提示
class ToastPage extends StatelessWidget {
  //内容视图
  Widget contentView(BuildContext context) {
    List<Widget> children = [];

    children.add(UiComponent.getListTile(title: '文字提示'));
    children.add(Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: VooButton(
        child: Text('文字提示'),
        onPressed: () {
          VooToast.showToast(context, msg: '文字提示');
        },
      ),
    ));

    children.add(UiComponent.getListTile(title: '加载提示'));
    children.add(Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: VooButton(
        child: Text('加载提示'),
        onPressed: () {
          Function close = VooToast.showLoading(context, msg: '加载中...');
          Future.delayed(Duration(seconds: 2), () {
            close();
          });
        },
      ),
    ));

    children.add(UiComponent.getListTile(title: '成功/失败提示'));
    children.add(Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: VooButton(
        child: Text('操作成功'),
        onPressed: () {
          Function close = VooToast.showResult(context, msg: '操作成功', result: VooToastResult.success);
          Future.delayed(Duration(seconds: 2), () {
            close();
          });
        },
      ),
    ));
    children.add(Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: VooButton(
        child: Text('失败提示'),
        onPressed: () {
          Function close = VooToast.showResult(context, msg: '失败提示', result: VooToastResult.fail);
          Future.delayed(Duration(seconds: 2), () {
            close();
          });
        },
      ),
    ));
    children.add(Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: VooButton(
        child: Text('警告信息'),
        onPressed: () {
          Function close = VooToast.showResult(context, msg: '警告信息', result: VooToastResult.warn);
          Future.delayed(Duration(seconds: 2), () {
            close();
          });
        },
      ),
    ));

    return SingleChildScrollView(child: Column(children: children));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UiComponent.getTitleBar(title: 'ToastPreview'),
      body: contentView(context),
    );
  }
}
