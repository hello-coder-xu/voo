import 'package:voo/cell/voo_cell_field.dart';
import 'package:voo/voo.dart';

import '../../comm/ui_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

///输入框
class FieldPage extends StatefulWidget {
  @override
  FieldPageState createState() => FieldPageState();
}

class FieldPageState extends State<FieldPage> {
  TextEditingController controller1 = TextEditingController(text: '100室内设计');
  TextEditingController controller2 = TextEditingController(text: '100室内设计');

  //内容视图
  Widget contentView() {
    List<Widget> children = [];

    children.add(SizedBox(height: 32));
    children.add(VooCellField(
      title: '昵称',
      border: InputBorder.none,
      hintText: '请输入昵称',
      showClear: true,
    ));

    children.add(SizedBox(height: 32));
    children.add(VooCellField(
      title: '坪数',
      border: InputBorder.none,
      hintText: '请输入坪数',
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'\d+'))],
      trailing: '坪',
    ));

    children.add(SizedBox(height: 32));
    children.add(VooCellField(
      title: '整数',
      border: InputBorder.none,
      hintText: '请输入整数',
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'\d+'))],
    ));

    children.add(SizedBox(height: 32));
    children.add(VooCellField(
      title: '昵称',
      hintText: '请输入昵称',
      onChanged: (value) {
        print('test value=$value');
      },
      controller: controller1,
    ));

    children.add(SizedBox(height: 32));
    children.add(VooCellField(
      title: '昵称',
      hintText: '请输入昵称',
      hintStyle: TextStyle(fontSize: 15, color: Colors.red),
    ));

    children.add(SizedBox(height: 32));
    children.add(VooCellField(
      title: '昵称',
      border: InputBorder.none,
      hintText: '请输入昵称',
      errorText: '请输入错误提示',
      // controller: controller2,
    ));

    children.add(SizedBox(height: 32));
    children.add(VooCellField(
      title: '密码',
      border: InputBorder.none,
      hintText: '请输入密码',
      align: TextAlign.start,
      showPwd: true,
    ));

    children.add(SizedBox(height: 32));
    children.add(VooCellFieldCode(
      title: '验证简讯',
      border: InputBorder.none,
      hintText: '请输入简讯',
      trailing: '发送',
      onTrailing: () {
        VooToast.showToast(context, msg: '已发送');
      },
    ));

    children.add(SizedBox(height: 32));
    children.add(VooCellField(
      title: '补充信息',
      border: InputBorder.none,
      hintText: '(选填)您的额个人喜好和其他详细信息',
      minLines: 3,
      maxLines: 10,
    ));

    children.add(SizedBox(height: 32));

    return SingleChildScrollView(
      child: Column(children: children),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UiComponent.getTitleBar(title: 'FieldPreview'),
      body: contentView(),
    );
  }
}
