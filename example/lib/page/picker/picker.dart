import 'package:voo/bottom_sheet/index.dart';
import 'package:voo/button/index.dart';
import 'package:voo/picker/picker_bean.dart';
import 'package:voo/picker/picker_linkage_bean.dart';
import 'package:voo/picker/voo_linkage_picker.dart';
import 'package:voo/picker/voo_picker.dart';
import 'package:voo/toast/index.dart';

import '../../comm/ui_component.dart';
import 'package:flutter/material.dart';

///选择器
class PickerPage extends StatelessWidget {
  ///内容视图
  Widget contentView(BuildContext context) {
    List<Widget> children = [];

    children.add(UiComponent.getListTile(title: '底部弹出'));
    children.add(VooButton(
      child: '非联机',
      onPressed: () => showPicker1(context),
    ));
    children.add(VooButton(
      child: '联机',
      onPressed: () => showPicker2(context),
    ));

    children.add(UiComponent.getListTile(title: '单项选择器'));
    children.add(VooPicker(
      list: [
        PickerBean(list: ['台中市', '高雄市', '台北市', '莲花市', '基隆市'])
      ],
      title: '城市',
      onConfirm: (value) {
        VooToast.showToast(context, msg: value);
      },
    ));

    children.add(UiComponent.getListTile(title: '多列选择器'));
    children.add(VooPicker(
      list: [
        PickerBean(list: ['1房', '2房', '3房', '4房', '5房']),
        PickerBean(list: ['1厅', '2厅', '3厅']),
        PickerBean(list: ['新屋', '老屋', '毛坯', '中古屋', '自地自建'])
      ],
      title: '房型',
      onConfirm: (value) {
        VooToast.showToast(context, msg: value);
      },
    ));

    children.add(UiComponent.getListTile(title: '级联选择器'));
    children.add(VooLinkagePicker(
      bean: PickerLinkageBean(
        child: [
          PickerLinkageBean(
            title: '广东省',
            child: [
              PickerLinkageBean(
                title: '深圳市',
                child: [
                  PickerLinkageBean(title: '龙华区'),
                  PickerLinkageBean(title: '福田区'),
                  PickerLinkageBean(title: '罗湖区'),
                ],
              ),
              PickerLinkageBean(
                title: '广州市',
                child: [
                  PickerLinkageBean(title: '越秀区'),
                  PickerLinkageBean(title: '天河区'),
                  PickerLinkageBean(title: '白云区'),
                ],
              ),
              PickerLinkageBean(
                title: '佛山市',
                child: [
                  PickerLinkageBean(title: '三水区'),
                  PickerLinkageBean(title: '南海区'),
                  PickerLinkageBean(title: '高明区'),
                ],
              ),
            ],
          ),
          PickerLinkageBean(
            title: '浙江省',
            child: [
              PickerLinkageBean(
                title: '杭州市',
                child: [
                  PickerLinkageBean(title: '上城区'),
                  PickerLinkageBean(title: '下城区'),
                  PickerLinkageBean(title: '西湖区'),
                ],
              ),
              PickerLinkageBean(
                title: '宁波市',
                child: [
                  PickerLinkageBean(title: '海曙区'),
                  PickerLinkageBean(title: '江东区'),
                  PickerLinkageBean(title: '江北区'),
                ],
              ),
              PickerLinkageBean(
                title: '温州市',
                child: [
                  PickerLinkageBean(title: '鹿城区'),
                  PickerLinkageBean(title: '龙湾区'),
                  PickerLinkageBean(title: '瓯海区'),
                ],
              ),
            ],
          ),
          PickerLinkageBean(
            title: '福建省',
            child: [
              PickerLinkageBean(
                title: '福州市',
                child: [
                  PickerLinkageBean(title: '台江区'),
                  PickerLinkageBean(title: '马尾区'),
                  PickerLinkageBean(title: '连江县'),
                ],
              ),
              PickerLinkageBean(
                title: '厦门市',
                child: [
                  PickerLinkageBean(title: '思明区'),
                  PickerLinkageBean(title: '海沧区'),
                  PickerLinkageBean(title: '同安区'),
                ],
              ),
              PickerLinkageBean(
                title: '莆田市',
                child: [
                  PickerLinkageBean(title: '荔城区'),
                  PickerLinkageBean(title: '涵江区'),
                  PickerLinkageBean(title: '城厢区'),
                ],
              ),
            ],
          ),
        ],
        select: 1,
      ),
      title: '地区选择',
      onConfirm: (value) {
        VooToast.showToast(context, msg: value);
      },
    ));

    children.add(UiComponent.getListTile(title: '选择年月日'));
    children.add(VooPicker(
      title: '选择年月日',
      list: [
        PickerBean(
          list: List.generate(5, (index) => '${index + 2020}').toList(),
          select: 0,
        ),
        PickerBean(
          list: List.generate(
                  12, (index) => index < 9 ? '0${index + 1}' : '${index + 1}')
              .toList(),
          select: 1,
        ),
        PickerBean(
          list: List.generate(
                  30, (index) => index < 9 ? '0${index + 1}' : '${index + 1}')
              .toList(),
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
          list: List.generate(
                  12, (index) => index < 9 ? '0${index + 1}月' : '${index + 1}月')
              .toList(),
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
          list: List.generate(
                  59, (index) => index < 9 ? '0${index + 1}' : '${index + 1}')
              .toList(),
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
          list: List.generate(
                  12, (index) => index < 9 ? '0${index + 1}' : '${index + 1}')
              .toList(),
        ),
        PickerBean(
          list: List.generate(
                  30, (index) => index < 9 ? '0${index + 1}' : '${index + 1}')
              .toList(),
        ),
        PickerBean(
          list: List.generate(10, (index) => '${index + 10}').toList(),
        ),
        PickerBean(
          list: List.generate(
                  59, (index) => index < 9 ? '0${index + 1}' : '${index + 1}')
              .toList(),
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
          list: List.generate(
                  59, (index) => index < 9 ? '0${index + 1}只' : '${index + 1}只')
              .toList(),
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
      appBar: UiComponent.getTitleBar(title: 'PickerPreview'),
      body: contentView(context),
    );
  }

  ///显示非联级
  void showPicker1(BuildContext context) {
    VooBottomSheet.showPicker(
      context: context,
      list: [
        PickerBean(list: ['台中市', '高雄市', '台北市', '莲花市', '基隆市'])
      ],
      title: '城市',
      onConfirm: (value) {
        VooToast.showToast(context, msg: value);
      },
    );
  }

  ///显示非联级
  void showPicker2(BuildContext context) {
    VooBottomSheet.showLinkagePicker(
      context: context,
      bean: PickerLinkageBean(
        child: [
          PickerLinkageBean(
            title: '广东省',
            child: [
              PickerLinkageBean(
                title: '深圳市',
                child: [
                  PickerLinkageBean(title: '龙华区'),
                  PickerLinkageBean(title: '福田区'),
                  PickerLinkageBean(title: '罗湖区'),
                ],
              ),
              PickerLinkageBean(
                title: '广州市',
                child: [
                  PickerLinkageBean(title: '越秀区'),
                  PickerLinkageBean(title: '天河区'),
                  PickerLinkageBean(title: '白云区'),
                ],
              ),
              PickerLinkageBean(
                title: '佛山市',
                child: [
                  PickerLinkageBean(title: '三水区'),
                  PickerLinkageBean(title: '南海区'),
                  PickerLinkageBean(title: '高明区'),
                ],
              ),
            ],
          ),
          PickerLinkageBean(
            title: '浙江省',
            child: [
              PickerLinkageBean(
                title: '杭州市',
                child: [
                  PickerLinkageBean(title: '上城区'),
                  PickerLinkageBean(title: '下城区'),
                  PickerLinkageBean(title: '西湖区'),
                ],
              ),
              PickerLinkageBean(
                title: '宁波市',
                child: [
                  PickerLinkageBean(title: '海曙区'),
                  PickerLinkageBean(title: '江东区'),
                  PickerLinkageBean(title: '江北区'),
                ],
              ),
              PickerLinkageBean(
                title: '温州市',
                child: [
                  PickerLinkageBean(title: '鹿城区'),
                  PickerLinkageBean(title: '龙湾区'),
                  PickerLinkageBean(title: '瓯海区'),
                ],
              ),
            ],
          ),
          PickerLinkageBean(
            title: '福建省',
            child: [
              PickerLinkageBean(
                title: '福州市',
                child: [
                  PickerLinkageBean(title: '台江区'),
                  PickerLinkageBean(title: '马尾区'),
                  PickerLinkageBean(title: '连江县'),
                ],
              ),
              PickerLinkageBean(
                title: '厦门市',
                child: [
                  PickerLinkageBean(title: '思明区'),
                  PickerLinkageBean(title: '海沧区'),
                  PickerLinkageBean(title: '同安区'),
                ],
              ),
              PickerLinkageBean(
                title: '莆田市',
                child: [
                  PickerLinkageBean(title: '荔城区'),
                  PickerLinkageBean(title: '涵江区'),
                  PickerLinkageBean(title: '城厢区'),
                ],
              ),
            ],
          ),
        ],
        select: 1,
      ),
      title: '地区选择',
      onConfirm: (value) {
        VooToast.showToast(context, msg: value);
      },
    );
  }
}
