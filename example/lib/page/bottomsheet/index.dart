import 'package:voo/bottom_sheet/index.dart';
import 'package:voo/cell/index.dart';
import 'package:voo/toast/index.dart';
import '../../comm/ui_component.dart';
import 'package:flutter/material.dart';

///底部面板
class BottomSheetPage extends StatelessWidget {
  //内容视图
  Widget contentView(BuildContext context) {
    List<Widget> children = [];
    children.add(UiComponent.getListTile(title: '列表面板'));
    children.add(VooCell(
      title: '列表面板',
      onTap: () => listPanel(context),
    ));
    children.add(UiComponent.getListTile(title: '文字说明操作'));
    children.add(VooCell(
      title: '文字说明操作',
      onTap: () => textOperation(context),
    ));
    children.add(UiComponent.getListTile(title: '宫格视图'));
    children.add(VooCell(
      title: '宫格视图',
      onTap: () => gridOperation(context),
    ));
    return SingleChildScrollView(child: Column(children: children));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UiComponent.getTitleBar(title: 'BottomSheetPreview'),
      body: contentView(context),
    );
  }

  //
  void listPanel(BuildContext context) {
    VooBottomSheet.showListView(
      context: context,
      list: ["选项一", "选项二", "选项三"],
      onSelect: (value) {
        VooToast.showToast(context, msg: value);
      },
      onCancel: () {
        VooToast.showToast(context, msg: '点击取消');
      },
    );
  }

  //
  void textOperation(BuildContext context) {
    VooBottomSheet.showDescribeView(
      context: context,
      child: Text('这是一个不可逆转的操作，用户需谨慎考虑再做出选择，这里是一个再次确认提醒。'),
      onDelete: () {
        VooToast.showToast(context, msg: '点击删除');
      },
      onCancel: () {
        VooToast.showToast(context, msg: '点击取消');
      },
    );
  }

  //
  void gridOperation(BuildContext context) {
    VooBottomSheet.showGridView(
      context: context,
      list: [
        VooBottomGridBean(icon: Container(color: Colors.grey), title: '致电咨询'),
        VooBottomGridBean(icon: Container(color: Colors.grey), title: '发送简讯'),
      ],
      onSelect: (int index) {
        VooToast.showToast(context, msg: '点击第$index个');
      },
    );
  }
}
