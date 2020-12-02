import 'package:voo/notify/index.dart';

import '../../comm/ui_component.dart';
import 'package:flutter/material.dart';
import 'package:voo/cell/index.dart';

///通知页面
class NotifyPage extends StatelessWidget {
  //内容
  Widget contentView(BuildContext context) {
    List<Widget> children = [];
    children.add(UiComponent.getListTile(title: '基础用法'));
    children.add(VooCell(
      title: Text('基础用法', style: TextStyle(fontSize: 16, color: Colors.black87)),
      trailing: Icon(Icons.chevron_right),
      onTap: () => showNotify(context, type: 'base'),
    ));

    children.add(UiComponent.getListTile(title: '通知类型'));
    children.add(VooCell(
      title: Text('主要通知', style: TextStyle(fontSize: 16, color: Colors.black87)),
      trailing: Icon(Icons.chevron_right),
      onTap: () => showNotify(context, type: 'primary'),
    ));
    children.add(Divider(height: 1));
    children.add(VooCell(
      title: Text('成功通知', style: TextStyle(fontSize: 16, color: Colors.black87)),
      trailing: Icon(Icons.chevron_right),
      onTap: () => showNotify(context, type: 'success'),
    ));
    children.add(Divider(height: 1));
    children.add(VooCell(
      title: Text('危险通知', style: TextStyle(fontSize: 16, color: Colors.black87)),
      trailing: Icon(Icons.chevron_right),
      onTap: () => showNotify(context, type: 'fail'),
    ));
    children.add(Divider(height: 1));
    children.add(VooCell(
      title: Text('警告通知', style: TextStyle(fontSize: 16, color: Colors.black87)),
      trailing: Icon(Icons.chevron_right),
      onTap: () => showNotify(context, type: 'warn'),
    ));

    children.add(UiComponent.getListTile(title: '自定配置'));
    children.add(VooCell(
      title: Text('自定义颜色', style: TextStyle(fontSize: 16, color: Colors.black87)),
      trailing: Icon(Icons.chevron_right),
      onTap: () => showNotify(context, type: 'custom_color'),
    ));
    children.add(Divider(height: 1));
    children.add(VooCell(
      title: Text('自定义时长', style: TextStyle(fontSize: 16, color: Colors.black87)),
      trailing: Icon(Icons.chevron_right),
      onTap: () => showNotify(context, type: 'custom_time'),
    ));

    children.add(UiComponent.getListTile(title: '自行关闭'));
    children.add(VooCell(
      title: Text('自行关闭', style: TextStyle(fontSize: 16, color: Colors.black87)),
      trailing: Icon(Icons.chevron_right),
      onTap: () => showNotify(context, type: 'async'),
    ));

    return SingleChildScrollView(
      padding: EdgeInsets.only(bottom: 32),
      child: Column(children: children),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UiComponent.getTitleBar(title: 'NotifyPreview'),
      body: contentView(context),
    );
  }

  void showNotify(BuildContext context, {String type}) {
    switch (type) {
      case 'base':
        VooNotify.show(
          context,
          child: Container(
            color: Colors.red,
            alignment: Alignment.center,
            padding: EdgeInsets.only(top: 32),
            height: 100,
            child: Text('通知内容', style: TextStyle(color: Colors.white)),
          ),
        );
        break;
      case 'primary':
        VooNotify.show(
          context,
          child: Container(
            color: Colors.blue,
            alignment: Alignment.center,
            padding: EdgeInsets.only(top: 32),
            height: 100,
            child: Text('通知内容', style: TextStyle(color: Colors.white)),
          ),
        );
        break;
      case 'success':
        VooNotify.show(
          context,
          child: Container(
            color: Colors.green,
            alignment: Alignment.center,
            padding: EdgeInsets.only(top: 32),
            height: 100,
            child: Text('通知内容', style: TextStyle(color: Colors.white)),
          ),
        );
        break;
      case 'fail':
        VooNotify.show(
          context,
          child: Container(
            color: Colors.red,
            alignment: Alignment.center,
            padding: EdgeInsets.only(top: 32),
            height: 100,
            child: Text('通知内容', style: TextStyle(color: Colors.white)),
          ),
        );
        break;
      case 'warn':
        VooNotify.show(
          context,
          child: Container(
            color: Colors.yellow,
            alignment: Alignment.center,
            padding: EdgeInsets.only(top: 32),
            height: 100,
            child: Text('通知内容', style: TextStyle(color: Colors.white)),
          ),
        );
        break;
      case 'custom_color':
        VooNotify.show(
          context,
          child: Container(
            color: Colors.deepOrangeAccent,
            alignment: Alignment.center,
            padding: EdgeInsets.only(top: 32),
            height: 100,
            child: Text('通知内容', style: TextStyle(color: Colors.blue)),
          ),
        );
        break;
      case 'custom_time':
        VooNotify.show(
          context,
          child: Container(
            color: Colors.deepOrangeAccent,
            alignment: Alignment.center,
            padding: EdgeInsets.only(top: 32),
            height: 100,
            child: Text('通知内容', style: TextStyle(color: Colors.blue)),
          ),
          duration: Duration(seconds: 5),
        );
        break;
      case 'async':
        Function close;
        close = VooNotify.show(
          context,
          child: Container(
            color: Colors.deepOrangeAccent,
            alignment: Alignment.center,
            padding: EdgeInsets.only(top: 32),
            height: 100,
            child: GestureDetector(
              onTap: () => close(),
              child: Text('点击关闭', style: TextStyle(color: Colors.blue)),
            ),
          ),
          isAsync: true,
          ignoring: false,
        );
        break;
    }
  }
}


