import 'package:example/comm/ui_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:voo/voo.dart';

///输入框
class FieldPage extends StatefulWidget {
  @override
  FieldPageState createState() => FieldPageState();
}

class FieldPageState extends State<FieldPage> {
  TextEditingController controller1 = TextEditingController();
  bool obscureText1 = true;

  //内容视图
  Widget contentView() {
    List<Widget> children = [];

    children.add(UiComponent.getListTile(title: '基础用法'));

    children.add(VooCellField(
      title: Text('文本', style: TextStyle(fontSize: 16, color: Colors.black87)),
      child: VooField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: '请输入文本',
          contentPadding: EdgeInsets.symmetric(vertical: 4),
          isCollapsed: true,
        ),
        style: TextStyle(fontSize: 16, color: Colors.black87),
        showClear: true,
      ),
      paddingWidth: 48,
    ));

    children.add(UiComponent.getListTile(title: '自定义类型'));
    children.add(VooCellField(
      title: Text('文本', style: TextStyle(fontSize: 16, color: Colors.black87)),
      child: VooField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: '请输入文本',
        ),
        style: TextStyle(fontSize: 16, color: Colors.black87),
      ),
      paddingWidth: 48,
    ));
    children.add(Divider(height: 1));
    children.add(VooCellField(
      title: Text('手机号', style: TextStyle(fontSize: 16, color: Colors.black87)),
      child: VooField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: '请输入手机号',
        ),
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'\d+'))],
        style: TextStyle(fontSize: 16, color: Colors.black87),
      ),
      paddingWidth: 32,
    ));
    children.add(Divider(height: 1));
    children.add(VooCellField(
      title: Text('整数', style: TextStyle(fontSize: 16, color: Colors.black87)),
      child: VooField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: '请输入整数',
        ),
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'\d+'))],
        style: TextStyle(fontSize: 16, color: Colors.black87),
      ),
      paddingWidth: 48,
    ));
    children.add(Divider(height: 1));
    children.add(VooCellField(
      title: Text('数字', style: TextStyle(fontSize: 16, color: Colors.black87)),
      child: VooField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: '请输入数字(支持小数)',
        ),
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[0-9.]"))],
        style: TextStyle(fontSize: 16, color: Colors.black87),
      ),
      paddingWidth: 48,
    ));
    children.add(Divider(height: 1));
    children.add(VooCellField(
      title: Text('密码', style: TextStyle(fontSize: 16, color: Colors.black87)),
      child: VooField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: '请输入密码',
        ),
        style: TextStyle(fontSize: 16, color: Colors.black87),
        showPwd: true,
      ),
      paddingWidth: 48,
    ));

    children.add(UiComponent.getListTile(title: '禁用输入框'));
    children.add(VooCellField(
      title: Text('文本', style: TextStyle(fontSize: 16, color: Colors.black87)),
      child: VooField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: '输入框只读',
        ),
        style: TextStyle(fontSize: 16, color: Colors.black87),
        readOnly: true,
      ),
      paddingWidth: 48,
    ));
    children.add(Divider(height: 1));
    children.add(VooCellField(
      title: Text('文本', style: TextStyle(fontSize: 16, color: Colors.black87)),
      child: VooField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: '输入框已禁用',
        ),
        style: TextStyle(fontSize: 16, color: Colors.black87),
        enabled: false,
      ),
      paddingWidth: 48,
    ));

    children.add(UiComponent.getListTile(title: '显示图标'));
    children.add(VooCellField(
      leading: Icon(VooIcon.mine),
      trailing: Icon(VooIcon.tick),
      title: Text('文本', style: TextStyle(fontSize: 16, color: Colors.black87)),
      child: VooField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: '显示图标',
        ),
        style: TextStyle(fontSize: 16, color: Colors.black87),
      ),
      paddingWidth: 16,
    ));
    children.add(Divider(height: 1));
    children.add(VooCellField(
      leading: Icon(VooIcon.search),
      title: Text('文本', style: TextStyle(fontSize: 16, color: Colors.black87)),
      child: VooField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: '显示清除图标',
        ),
        style: TextStyle(fontSize: 16, color: Colors.black87),
        showClear: true,
      ),
      paddingWidth: 16,
    ));

    children.add(UiComponent.getListTile(title: '错误提示'));
    children.add(VooCellField(
      leading: Text('*', style: TextStyle(color: Colors.red)),
      title: Text('用户名', style: TextStyle(fontSize: 16, color: Colors.black87)),
      child: VooField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: '请输入用户名',
          errorText: '用户名格式错误',
        ),
        style: TextStyle(fontSize: 16, color: Colors.black87),
      ),
      paddingWidth: 16,
    ));
    children.add(Divider(height: 1));
    children.add(VooCellField(
      leading: Text('*', style: TextStyle(color: Colors.red)),
      title: Text('手机号', style: TextStyle(fontSize: 16, color: Colors.black87)),
      child: VooField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: '请输入手机号',
          errorText: '手机号格式错误',
        ),
        style: TextStyle(fontSize: 16, color: Colors.black87),
      ),
      paddingWidth: 16,
    ));

    children.add(UiComponent.getListTile(title: '插入按钮'));
    children.add(VooCellField(
      title: Text('短信验证码', style: TextStyle(fontSize: 16, color: Colors.black87)),
      child: VooField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: '请输入验证码',
        ),
        style: TextStyle(fontSize: 16, color: Colors.black87),
      ),
      trailing: Container(
        width: 100,
        height: 30,
        child: VooButton(
          child: Text('发送验证码'),
          onPressed: () {
            VooToast.showToast(context, msg: '发送验证码');
          },
        ),
      ),
      paddingWidth: 16,
    ));

    children.add(UiComponent.getListTile(title: '高度自适应'));
    children.add(VooCellField(
      title: Text('留言', style: TextStyle(fontSize: 16, color: Colors.black87)),
      child: Padding(
        padding: EdgeInsets.only(top: 16),
        child: VooField(
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: '输入留言',
            contentPadding: EdgeInsets.symmetric(vertical: 4),
            isCollapsed: true,
          ),
          style: TextStyle(fontSize: 16, color: Colors.black87),
          minLines: 3,
          maxLines: 10,
        ),
      ),
      paddingWidth: 48,
    ));

    children.add(UiComponent.getListTile(title: '显示字数统计'));
    children.add(VooCellField(
      title: Text('留言', style: TextStyle(fontSize: 16, color: Colors.black87)),
      child: Padding(
        padding: EdgeInsets.only(top: 16),
        child: VooField(
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: '输入留言',
            contentPadding: EdgeInsets.symmetric(vertical: 4),
            isCollapsed: true,
          ),
          style: TextStyle(fontSize: 16, color: Colors.black87),
          minLines: 3,
          maxLines: 10,
          maxLength: 50,
        ),
      ),
      paddingWidth: 48,
    ));

    children.add(UiComponent.getListTile(title: '输入框内容对齐'));
    children.add(VooCellField(
      title: Text('文本', style: TextStyle(fontSize: 16, color: Colors.black87)),
      child: VooField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: '输入文本',
        ),
        textAlign: TextAlign.end,
        style: TextStyle(fontSize: 16, color: Colors.black87),
      ),
      paddingWidth: 48,
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
