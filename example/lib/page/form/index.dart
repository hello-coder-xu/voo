import 'package:voo/cell/voo_cell_field.dart';
import 'package:voo/checkbox/voo_checkbox.dart';
import 'package:voo/field/index.dart';
import 'package:voo/picker/picker_bean.dart';
import 'package:voo/picker/voo_picker.dart';
import 'package:voo/radio/voo_radio.dart';

import '../../comm/ui_component.dart';
import 'package:flutter/material.dart';

///按钮页面
class FormPage extends StatefulWidget {
  @override
  FormPageState createState() => FormPageState();
}

class FormPageState extends State<FormPage> {
  String cityValue = '';
  int group = 0;
  bool checkBox1 = false;
  bool checkBox2 = false;
  bool switchValue = false;

  Widget contentView() {
    List<Widget> children = [];
    children.add(UiComponent.getListTile(title: '输入框'));

    children.add(VooCellField(
      title: Text('昵称', style: TextStyle(fontSize: 16)),
      child: VooField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: '请输入昵称',
        ),
      ),
      paddingWidth: 48,
    ));

    children.add(UiComponent.getListTile(title: '密码输入框'));
    children.add(VooCellField(
      title: Text('密码', style: TextStyle(fontSize: 16)),
      child: VooField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: '请输入密码',
        ),
        showPwd: true,
      ),
      paddingWidth: 48,
    ));

    children.add(UiComponent.getListTile(title: '验证码输入'));
    children.add(VooCellField(
      title: Text('手机号', style: TextStyle(fontSize: 16)),
      child: VooField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: '输入手机号',
        ),
      ),
      trailing: Text('发送', style: TextStyle(color: Colors.green)),
      paddingWidth: 32,
    ));

    children.add(UiComponent.getListTile(title: '选择文本框'));

    bool hasSelect = cityValue.length != 0;
    children.add(VooCellField(
      leading: Text('*', style: TextStyle(color: Colors.red)),
      title: Text('所在城市'),
      child: GestureDetector(
        onTap: showCityMenu,
        behavior: HitTestBehavior.translucent,
        child: Container(
          width: double.infinity,
          child: Text(
            hasSelect ? cityValue : '点击选中所在城市',
            style: TextStyle(
              color: hasSelect ? Colors.black87 : Colors.grey,
            ),
          ),
        ),
      ),
    ));

    children.add(UiComponent.getListTile(title: '多行输入框'));
    children.add(VooCellField(
      title: Text('喜欢', style: TextStyle(fontSize: 16, color: Colors.black87)),
      child: Padding(
        padding: EdgeInsets.only(top: 8),
        child: VooField(
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: '(选填)您的个人喜好与其他更详细信息',
          ),
          style: TextStyle(fontSize: 16, color: Colors.black87),
          minLines: 3,
          maxLines: 10,
        ),
      ),
      paddingWidth: 16,
    ));

    children.add(UiComponent.getListTile(title: '单/复选框'));
    children.add(VooCellField(
      title: Text('单选框'),
      child: Row(
        children: [
          VooRadio(
            child: '单选框1',
            group: group,
            value: 1,
            onChanged: (value) => radioOnChanged(1),
          ),
          SizedBox(width: 16),
          VooRadio(
            child: '单选框2',
            group: group,
            value: 2,
            onChanged: (value) => radioOnChanged(2),
          ),
        ],
      ),
      paddingWidth: 32,
    ));
    children.add(Divider(height: 1));
    children.add(VooCellField(
      title: Text('单选框'),
      child: Row(
        children: [
          VooCheckBox(
            child: '复选框1',
            value: checkBox1,
            onChanged: (value) {
              checkBox1 = value;
              setState(() {});
            },
          ),
          SizedBox(width: 16),
          VooCheckBox(
            child: '复选框2',
            value: checkBox2,
            onChanged: (value) {
              checkBox2 = value;
              setState(() {});
            },
          ),
        ],
      ),
      paddingWidth: 32,
    ));

    children.add(UiComponent.getListTile(title: '开关'));
    children.add(VooCellField(
      title: Text('推送通知'),
      child: Switch(
        value: switchValue,
        onChanged: (value) {
          switchValue = value;
          setState(() {});
        },
      ),
      paddingWidth: 16,
    ));

    return SingleChildScrollView(
      padding: EdgeInsets.only(bottom: 32),
      child: Column(children: children),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UiComponent.getTitleBar(title: 'FormPreview'),
      body: contentView(),
    );
  }

  void showCityMenu() {
    showModalBottomSheet(
      context: context,
      builder: (context) => VooPicker(
        list: [
          PickerBean(list: ['杭州', '宁波', '温州', '嘉兴', '湖州'])
        ],
        title: '城市',
        onConfirm: (value) {
          cityValue = value;
          if (mounted) setState(() {});
          Navigator.pop(context);
        },
      ),
    );
  }

  void radioOnChanged(int index) {
    group = index;
    if (mounted) setState(() {});
  }
}
