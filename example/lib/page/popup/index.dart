import 'package:voo/popup/index.dart';

import '../../comm/ui_component.dart';
import 'package:flutter/material.dart';
import 'package:voo/cell/index.dart';

///弹出框
class PopupPage extends StatelessWidget {
  //内容视图
  Widget contentView(BuildContext context) {
    List<Widget> children = [];

    children.add(UiComponent.getListTile(title: '基础用法'));
    children.add(VooCell(
      title: Text('展示弹出层'),
      trailing: Icon(Icons.chevron_right),
      onTap: () => showPopup(context, 'base'),
    ));

    children.add(UiComponent.getListTile(title: '弹出位置'));
    children.add(VooCell(
      title: Text('顶部弹出'),
      trailing: Icon(Icons.chevron_right),
      onTap: () => showPopup(context, 'top'),
    ));
    children.add(Divider(height: 1));
    children.add(VooCell(
      title: Text('底部弹出'),
      trailing: Icon(Icons.chevron_right),
      onTap: () => showPopup(context, 'bottom'),
    ));
    children.add(Divider(height: 1));
    children.add(VooCell(
      title: Text('左侧弹出'),
      trailing: Icon(Icons.chevron_right),
      onTap: () => showPopup(context, 'left'),
    ));
    children.add(Divider(height: 1));
    children.add(VooCell(
      title: Text('右侧弹出'),
      trailing: Icon(Icons.chevron_right),
      onTap: () => showPopup(context, 'right'),
    ));

    children.add(UiComponent.getListTile(title: '关闭图标'));
    children.add(VooCell(
      title: Text('关闭图标'),
      trailing: Icon(Icons.chevron_right),
      onTap: () => showPopup(context, 'closeIcon'),
    ));
    children.add(Divider(height: 1));
    children.add(VooCell(
      title: Text('自定义图标'),
      trailing: Icon(Icons.chevron_right),
      onTap: () => showPopup(context, 'customIcon'),
    ));
    children.add(Divider(height: 1));
    children.add(VooCell(
      title: Text('图标位置'),
      trailing: Icon(Icons.chevron_right),
      onTap: () => showPopup(context, 'iconLocal'),
    ));

    children.add(UiComponent.getListTile(title: '圆角弹窗'));
    children.add(VooCell(
      title: Text('圆角弹窗'),
      trailing: Icon(Icons.chevron_right),
      onTap: () => showPopup(context, 'round'),
    ));

    children.add(UiComponent.getListTile(title: '自定义挂载'));
    children.add(VooCell(
      title: Text('指定挂载节点'),
      trailing: Icon(Icons.chevron_right),
      onTap: () => showPopup(context, 'custom'),
    ));

    return SingleChildScrollView(child: Column(children: children));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UiComponent.getTitleBar(title: 'PopupPreview'),
      body: contentView(context),
    );
  }

  //显示pop
  void showPopup(BuildContext context, String type) {
    Widget child;
    VooPopupType vooPopupType;
    switch (type) {
      case 'base':
        vooPopupType = VooPopupType.none;
        child = Container(width: 80, height: 80, color: Colors.white);
        break;
      case 'top':
        vooPopupType = VooPopupType.top;
        child = Container(width: double.infinity, height: 200, color: Colors.white);
        break;
      case 'bottom':
        vooPopupType = VooPopupType.bottom;
        child = Container(width: double.infinity, height: 200, color: Colors.white);
        break;
      case 'left':
        vooPopupType = VooPopupType.left;
        child = Container(width: 120, height: double.infinity, color: Colors.white);
        break;
      case 'right':
        vooPopupType = VooPopupType.right;
        child = Container(width: 120, height: double.infinity, color: Colors.white);
        break;
      case 'closeIcon':
        vooPopupType = VooPopupType.bottom;
        child = Container(
          width: double.infinity,
          height: 200,
          color: Colors.white,
          alignment: Alignment.topRight,
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Icon(Icons.close),
            ),
          ),
        );
        break;
      case 'customIcon':
        vooPopupType = VooPopupType.bottom;
        child = Container(
          width: double.infinity,
          height: 200,
          color: Colors.white,
          alignment: Alignment.topRight,
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Icon(Icons.cancel),
            ),
          ),
        );
        break;
      case 'iconLocal':
        vooPopupType = VooPopupType.bottom;
        child = Container(
          width: double.infinity,
          height: 200,
          color: Colors.white,
          alignment: Alignment.topLeft,
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Icon(Icons.close),
            ),
          ),
        );
        break;
      case 'round':
        vooPopupType = VooPopupType.bottom;
        child = Container(
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          ),
          alignment: Alignment.topRight,
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Icon(Icons.close),
            ),
          ),
        );
        break;
      case 'custom':
        vooPopupType = VooPopupType.none;
        child = Container(
          width: 80,
          height: 80,
          color: Colors.white,
        );
        break;
    }

    VooPopup.showPopup(
      context: context,
      type: vooPopupType,
      builder: (context) => child,
    );
  }
}

