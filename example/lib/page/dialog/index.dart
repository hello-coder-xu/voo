import 'package:example/comm/ui_component.dart';
import 'package:flutter/material.dart';
import 'package:voo/voo.dart';

///对话框
class DialogPage extends StatelessWidget {
  //item 视图
  Widget itemView({String title = '', VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Text(title),
      ),
    );
  }

  //内容视图
  Widget contentView(BuildContext context) {
    List<Widget> children = [];

    children.add(UiComponent.getListTile(title: '带图弹窗'));
    children.add(Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: Wrap(
        runSpacing: 10,
        spacing: 10,
        alignment: WrapAlignment.start,
        children: [
          itemView(title: '带图标弹框', onTap: () => iconDialog(context)),
          itemView(title: '图片弹框', onTap: () => imageDialog(context)),
          itemView(title: '大图片弹框', onTap: () => largeImageDialog(context)),
        ],
      ),
    ));
    children.add(UiComponent.getListTile(title: '不带图弹窗'));
    children.add(Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: Wrap(
        runSpacing: 10,
        spacing: 10,
        children: [
          itemView(title: '无标题弹框', onTap: () => noTitleDialog(context)),
          itemView(title: '单按钮弹框', onTap: () => singleButtonDialog(context)),
          itemView(title: '横向双按钮弹框', onTap: () => hDoubleButtonDialog(context)),
          itemView(title: '纵向双按钮弹框', onTap: () => vDoubleButtonDialog(context)),
          itemView(title: '纵向三按钮弹框', onTap: () => vThreeButtonDialog(context)),
        ],
      ),
    ));
    children.add(UiComponent.getListTile(title: '运营活动弹窗'));
    children.add(Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: Wrap(
        runSpacing: 10,
        spacing: 10,
        children: [
          itemView(title: '运营活动弹窗-小', onTap: () => smallOperatingDialog(context)),
          itemView(title: '运营活动弹窗-大', onTap: () => largeOperatingDialog(context)),
        ],
      ),
    ));
    return SingleChildScrollView(child: Column(children: children));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UiComponent.getTitleBar(title: 'DialogPreview'),
      body: contentView(context),
    );
  }

  //图标弹框
  void iconDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return VooImageDialog(
          title: '标题',
          fit: false,
          icon: Icon(VooIcon.company),
          content: Text('说明文案，言简意赅最好不超过2行'),
          confirm: Text('主操作'),
          onConfirm: () {
            VooToast.showToast(context, msg: '点击主操作');
          },
          close: () {
            VooToast.showToast(context, msg: '点击关闭');
          },
        );
      },
    );
  }

  //图片弹框
  void imageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return VooImageDialog(
          title: '标题',
          fit: false,
          icon: Image.asset('assets/icon/100.png', width: 120, height: 120),
          content: Text('说明文案，言简意赅最好不超过2行'),
          confirm: Text('主操作'),
          onConfirm: () {
            VooToast.showToast(context, msg: '点击主操作');
          },
          close: () {
            VooToast.showToast(context, msg: '点击关闭');
          },
        );
      },
    );
  }

  //大图片弹框
  void largeImageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return VooImageDialog(
          title: '标题',
          fit: true,
          icon: Image.asset('assets/comm/banner.webp'),
          closeIcon: Icon(Icons.close, color: Colors.white),
          content: Text('说明文案，言简意赅最好不超过2行'),
          confirm: Text('主操作'),
          onConfirm: () {
            VooToast.showToast(context, msg: '点击主操作');
          },
          close: () {
            VooToast.showToast(context, msg: '点击关闭');
          },
        );
      },
    );
  }

  //无标题
  void noTitleDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return VooDialog(
          content: Text('说明文案，言简意赅最好不超过2行'),
          cancel: Text('辅助操作'),
          confirm: Text('主操作'),
          onCancel: () {
            VooToast.showToast(context, msg: '辅助操作');
          },
          onConfirm: () {
            VooToast.showToast(context, msg: '主操作');
          },
        );
      },
    );
  }

  //单按钮
  void singleButtonDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return VooDialog(
          title: '标题',
          content: Text('说明文案，言简意赅最好不超过2行'),
          confirm: Text('主操作'),
          onConfirm: () {
            VooToast.showToast(context, msg: '点击主操作');
          },
        );
      },
    );
  }

  //横向双按钮
  void hDoubleButtonDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return VooDialog(
          title: '标题',
          content: Text('说明文案，言简意赅最好不超过2行'),
          cancel: Text('辅助操作'),
          confirm: Text('主操作'),
          onCancel: () {
            VooToast.showToast(context, msg: '点击辅助操作');
          },
          onConfirm: () {
            VooToast.showToast(context, msg: '点击主操作');
          },
        );
      },
    );
  }

  //纵向双按钮
  void vDoubleButtonDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return VooDialog(
          title: '标题',
          content: Text('说明文案，言简意赅最好不超过2行'),
          cancel: Text('辅助操作'),
          confirm: Text('主操作'),
          horizontal: false,
          onCancel: () {
            VooToast.showToast(context, msg: '点击辅助操作');
          },
          onConfirm: () {
            VooToast.showToast(context, msg: '点击主操作');
          },
        );
      },
    );
  }

  //纵向三按钮
  void vThreeButtonDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return VooDialog(
          title: '标题',
          content: Text('说明文案，言简意赅最好不超过2行'),
          confirm: Text('主操作'),
          middle: Text('更多'),
          cancel: Text('辅助操作'),
          horizontal: false,
          onCancel: () {
            VooToast.showToast(context, msg: '点击辅助操作');
          },
          onMiddle: () {
            VooToast.showToast(context, msg: '点击更多');
          },
          onConfirm: () {
            VooToast.showToast(context, msg: '点击主操作');
          },
        );
      },
    );
  }

  //运营活动弹框-小
  void smallOperatingDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return VooOperatingDialog(
          child: Image.asset(
            'assets/comm/banner.webp',
            width: double.infinity,
            height: 300,
            fit: BoxFit.cover,
          ),
          insetPadding: EdgeInsets.symmetric(horizontal: 32),
          close: () {
            VooToast.showToast(context, msg: '点击关闭');
          },
        );
      },
    );
  }

  //运营活动弹框-大
  void largeOperatingDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return VooOperatingDialog(
          child: Image.asset(
            'assets/comm/banner.webp',
            width: double.infinity,
            height: 300,
            fit: BoxFit.cover,
          ),
          close: () {
            VooToast.showToast(context, msg: '点击关闭');
          },
        );
      },
    );
  }
}
