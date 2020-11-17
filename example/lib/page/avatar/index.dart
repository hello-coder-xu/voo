import '../../comm/ui_component.dart';
import 'package:flutter/material.dart';
import 'package:voo/voo.dart';

///头像
class AvatarPage extends StatelessWidget {
  ///内容
  Widget contentView() {
    List<Widget> children = [];

    children.add(UiComponent.getListTile(title: '默认头像'));
    children.add(Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: VooAvatar(
        icon: Image.asset('assets/icon/100.png'),
      ),
    ));

    children.add(SizedBox(height: 16));

    children.add(UiComponent.getListTile(title: '基础用法'));
    children.add(Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: VooAvatar(
        icon: Image.asset('assets/icon/100.png'),
        theme: VooAvatarTheme.normal,
      ),
    ));

    children.add(SizedBox(height: 16));

    children.add(UiComponent.getListTile(title: '描述信息'));
    children.add(Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: VooAvatar(
        icon: Image.asset('assets/icon/100.png'),
        theme: VooAvatarTheme.normal,
        title: 'Voo',
        subTitle: '100室内设计组件库',
      ),
    ));

    children.add(SizedBox(height: 16));

    children.add(UiComponent.getListTile(title: '头像尺寸'));
    children.add(Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: VooAvatar(
        icon: Image.asset('assets/icon/100.png'),
        theme: VooAvatarTheme.mini,
        title: 'Voo mini',
      ),
    ));

    children.add(SizedBox(height: 16));

    children.add(Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: VooAvatar(
        icon: Image.asset('assets/icon/100.png'),
        theme: VooAvatarTheme.small,
        title: 'Voo small',
      ),
    ));

    children.add(SizedBox(height: 16));
    children.add(Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: VooAvatar(
        icon: Image.asset('assets/icon/100.png'),
        theme: VooAvatarTheme.normal,
        title: 'Voo normal',
        subTitle: '100室内设计组件库',
      ),
    ));

    children.add(SizedBox(height: 16));
    children.add(Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: VooAvatar(
        icon: Image.asset('assets/icon/100.png'),
        theme: VooAvatarTheme.large,
        title: 'Voo large',
        subTitle: '100室内设计组件库',
      ),
    ));

    return SingleChildScrollView(child: Column(children: children));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UiComponent.getTitleBar(title: 'AvatarPreview'),
      body: contentView(),
    );
  }
}
