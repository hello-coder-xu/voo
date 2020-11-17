import '../../comm/ui_component.dart';
import 'package:flutter/material.dart';
import 'package:voo/voo.dart';

///时间选择器
class DateTimePickerPage extends StatelessWidget {
  ///内容视图
  Widget contentView(BuildContext context) {
    List<Widget> children = [];

    children.add(UiComponent.getListTile(title: '选择年月日'));
    children.add(VooPicker(
      title: '选择年月日',
      list: [
        PickerBean(
          list: List.generate(5, (index) => '${index + 2020}').toList(),
          select: 0,
        ),
        PickerBean(
          list: List.generate(12, (index) => index < 9 ? '0${index + 1}' : '${index + 1}').toList(),
          select: 1,
        ),
        PickerBean(
          list: List.generate(30, (index) => index < 9 ? '0${index + 1}' : '${index + 1}').toList(),
          select: 1,
        ),
      ],
      onConfirm: (String value) {
        VooToast.showToast(context, msg: value);
      },
    ));
    children.add(UiComponent.getListTile(title: '选择年月'));
    children.add(VooPicker(
      title: '选择年月',
      list: [
        PickerBean(
          list: List.generate(5, (index) => '${index + 2020}年').toList(),
          select: 2,
        ),
        PickerBean(
          list: List.generate(12, (index) => index < 9 ? '0${index + 1}月' : '${index + 1}月').toList(),
          select: 1,
        ),
      ],
      onConfirm: (String value) {
        VooToast.showToast(context, msg: value);
      },
    ));
    children.add(UiComponent.getListTile(title: '选择时间'));
    children.add(VooPicker(
      title: '选择时间',
      list: [
        PickerBean(
          list: List.generate(10, (index) => '${index + 10}').toList(),
          select: 2,
        ),
        PickerBean(
          list: List.generate(59, (index) => index < 9 ? '0${index + 1}' : '${index + 1}').toList(),
          select: 1,
        ),
      ],
      onConfirm: (String value) {
        VooToast.showToast(context, msg: value);
      },
    ));

    children.add(UiComponent.getListTile(title: '选择完整时间'));
    children.add(VooPicker(
      title: '选择完整时间',
      list: [
        PickerBean(
          list: List.generate(5, (index) => '${index + 2020}').toList(),
        ),
        PickerBean(
          list: List.generate(12, (index) => index < 9 ? '0${index + 1}' : '${index + 1}').toList(),
        ),
        PickerBean(
          list: List.generate(30, (index) => index < 9 ? '0${index + 1}' : '${index + 1}').toList(),
        ),
        PickerBean(
          list: List.generate(10, (index) => '${index + 10}').toList(),
        ),
        PickerBean(
          list: List.generate(59, (index) => index < 9 ? '0${index + 1}' : '${index + 1}').toList(),
        ),
      ],
      onConfirm: (String value) {
        VooToast.showToast(context, msg: value);
      },
    ));

    children.add(UiComponent.getListTile(title: '选项过滤器'));
    children.add(VooPicker(
      title: '选项过滤器',
      list: [
        PickerBean(
          list: List.generate(10, (index) => '${index + 10}个').toList(),
          select: 2,
        ),
        PickerBean(
          list: List.generate(59, (index) => index < 9 ? '0${index + 1}只' : '${index + 1}只').toList(),
          select: 1,
        ),
      ],
      onConfirm: (String value) {
        VooToast.showToast(context, msg: value);
      },
    ));
    return SingleChildScrollView(child: Column(children: children));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UiComponent.getTitleBar(title: 'DatetimePicker'),
      body: contentView(context),
    );
  }
}
