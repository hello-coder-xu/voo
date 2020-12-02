import 'package:voo/bottom_sheet/index.dart';
import 'package:voo/cell/index.dart';
import 'package:voo/color/index.dart';
import 'package:voo/icon/index.dart';
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
      title: Text('列表面板'),
      trailing: Icon(VooIcon.arrow_right, size: 16, color: VooColors.subTitleColor),
      onTap: () => listPanel(context),
    ));
    children.add(UiComponent.getListTile(title: '文字说明操作'));
    children.add(VooCell(
      title: Text('文字说明操作'),
      trailing: Icon(VooIcon.arrow_right, size: 16, color: VooColors.subTitleColor),
      onTap: () => textOperation(context),
    ));
    children.add(UiComponent.getListTile(title: '自定义视图'));
    children.add(VooCell(
      title: Text('自定义视图'),
      trailing: Icon(VooIcon.arrow_right, size: 16, color: VooColors.subTitleColor),
      onTap: () => customOperation(context),
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
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(25.0))),
      builder: (context) => VBottomSheetOptionView(
        list: ["选项一", "选项二", "选项三"],
        onSelect: (value) {
          VooToast.showToast(context, msg: value);
        },
        onCancel: () {
          VooToast.showToast(context, msg: '点击取消');
        },
      ),
    );
  }

  //
  void textOperation(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(25.0))),
      builder: (context) => VBottomSheetTextView(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Text('这是一个不可逆转的操作，用户需谨慎考虑再做出选择，这里是一个再次确认提醒。'),
        ),
        onDelete: () {
          VooToast.showToast(context, msg: '点击删除');
        },
        onCancel: () {
          VooToast.showToast(context, msg: '点击取消');
        },
      ),
    );
  }

  //
  void customOperation(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        height: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(VooIcon.company, size: 30),
                Icon(VooIcon.image_select, size: 30),
              ],
            ),
            Text('自定义视图，可任意需改视图'),
          ],
        ),
      ),
    );
  }
}
