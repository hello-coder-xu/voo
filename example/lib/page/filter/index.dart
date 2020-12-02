import 'package:example/comm/platform_utils.dart';
import 'package:voo/filter/index.dart';
import 'package:voo/filter/voo_filter_bean.dart';
import 'package:voo/filter/voo_filter_content.dart';
import 'package:voo/filter/voo_filter_tab.dart';

import '../../comm/ui_component.dart';
import 'package:flutter/material.dart';


///筛选页面
class FilterPage extends StatefulWidget {
  @override
  FilterPageState createState() => FilterPageState();
}

class FilterPageState extends State<FilterPage> {
  List<VooFilterBean> filterTabList1 = [
    VooFilterBean(title: '位置'),
    VooFilterBean(title: '预算'),
    VooFilterBean(title: '风格')
  ];
  List<List<VooFilterBean>> filterContentList1 = [
    [
      VooFilterBean(title: '地区不限'),
      VooFilterBean(title: '东区'),
      VooFilterBean(title: '南区'),
      VooFilterBean(title: '西区'),
      VooFilterBean(title: '北区'),
      VooFilterBean(title: '北区2'),
    ],
    [
      VooFilterBean(title: '100元'),
      VooFilterBean(title: '200元'),
      VooFilterBean(title: '300元'),
      VooFilterBean(title: '400元'),
      VooFilterBean(title: '500元'),
      VooFilterBean(title: '600元'),
      VooFilterBean(title: '700元'),
      VooFilterBean(title: '100元'),
      VooFilterBean(title: '200元'),
      VooFilterBean(title: '300元'),
      VooFilterBean(title: '400元'),
      VooFilterBean(title: '500元'),
      VooFilterBean(title: '600元'),
      VooFilterBean(title: '700元'),
      VooFilterBean(title: '100元'),
      VooFilterBean(title: '200元'),
      VooFilterBean(title: '300元'),
      VooFilterBean(title: '400元'),
      VooFilterBean(title: '500元'),
      VooFilterBean(title: '600元'),
      VooFilterBean(title: '700元'),
      VooFilterBean(title: '100元'),
      VooFilterBean(title: '200元'),
      VooFilterBean(title: '300元'),
      VooFilterBean(title: '400元'),
      VooFilterBean(title: '500元'),
      VooFilterBean(title: '600元'),
      VooFilterBean(title: '700元'),
      VooFilterBean(title: '100元'),
      VooFilterBean(title: '200元'),
      VooFilterBean(title: '300元'),
      VooFilterBean(title: '400元'),
      VooFilterBean(title: '500元'),
      VooFilterBean(title: '600元'),
      VooFilterBean(title: '700元'),
      VooFilterBean(title: '100元'),
      VooFilterBean(title: '200元'),
      VooFilterBean(title: '300元'),
      VooFilterBean(title: '400元'),
      VooFilterBean(title: '500元'),
      VooFilterBean(title: '600元'),
      VooFilterBean(title: '700元'),
      VooFilterBean(title: '100元'),
      VooFilterBean(title: '200元'),
      VooFilterBean(title: '300元'),
      VooFilterBean(title: '400元'),
      VooFilterBean(title: '500元'),
      VooFilterBean(title: '600元'),
      VooFilterBean(title: '700元'),
      VooFilterBean(title: '100元'),
      VooFilterBean(title: '200元'),
      VooFilterBean(title: '300元'),
      VooFilterBean(title: '400元'),
      VooFilterBean(title: '500元'),
      VooFilterBean(title: '600元'),
      VooFilterBean(title: '700元'),
      VooFilterBean(title: '100元'),
      VooFilterBean(title: '200元'),
      VooFilterBean(title: '300元'),
      VooFilterBean(title: '400元'),
      VooFilterBean(title: '500元'),
      VooFilterBean(title: '600元'),
      VooFilterBean(title: '700元'),
    ],
    [
      VooFilterBean(title: '风格不限'),
      VooFilterBean(title: '现代风'),
      VooFilterBean(title: '混搭风'),
      VooFilterBean(title: '北欧风'),
      VooFilterBean(title: '工业风'),
      VooFilterBean(title: '日式风'),
      VooFilterBean(title: '古典风'),
      VooFilterBean(title: '乡村风'),
    ],
  ];

  List<VooFilterBean> filterTabList2 = [
    VooFilterBean(title: '位置'),
    VooFilterBean(title: '预算'),
    VooFilterBean(title: '默认排序')
  ];
  List<List<VooFilterBean>> filterContentList2 = [
    [
      VooFilterBean(title: '地区不限'),
      VooFilterBean(title: '东区'),
      VooFilterBean(title: '南区'),
      VooFilterBean(title: '西区'),
      VooFilterBean(title: '北区'),
      VooFilterBean(title: '北区2'),
    ],
    [
      VooFilterBean(title: '100元'),
      VooFilterBean(title: '200元'),
      VooFilterBean(title: '300元'),
      VooFilterBean(title: '400元'),
      VooFilterBean(title: '500元'),
      VooFilterBean(title: '600元'),
      VooFilterBean(title: '700元'),
      VooFilterBean(title: '100元'),
      VooFilterBean(title: '200元'),
      VooFilterBean(title: '300元'),
      VooFilterBean(title: '400元'),
      VooFilterBean(title: '500元'),
      VooFilterBean(title: '600元'),
      VooFilterBean(title: '700元'),
      VooFilterBean(title: '100元'),
      VooFilterBean(title: '200元'),
      VooFilterBean(title: '300元'),
      VooFilterBean(title: '400元'),
      VooFilterBean(title: '500元'),
      VooFilterBean(title: '600元'),
      VooFilterBean(title: '700元'),
    ],
    [
      VooFilterBean(title: '默认排序'),
      VooFilterBean(title: '好评排序'),
      VooFilterBean(title: '销量排序'),
    ],
  ];

  int selectIndex1;
  int selectIndex2;

  //内容视图
  Widget contentView() {
    List<Widget> children = [];
    children.add(UiComponent.getListTile(title: '单选标签筛选和多选标签筛选'));

    children.add(VooFilterTab(
      list: filterTabList1,
      onSelect: onSelectTabTap1,
    ));

    children.add(UiComponent.getListTile(title: '列表筛选'));

    children.add(VooFilterTab(
      list: filterTabList2,
      onSelect: onSelectTabTap2,
    ));

    return SingleChildScrollView(child: Column(children: children));
  }

  //筛选视图
  Widget filterView1() {
    if (selectIndex1 == null) return SizedBox.shrink();

    VooFilterContentType type;
    switch (selectIndex1) {
      case 0:
      case 1:
        type = VooFilterContentType.warp;
        break;
      case 2:
        type = VooFilterContentType.warp_button;
        break;
    }
    Widget child = VooFilterContent(
      filterContentList: filterContentList1[selectIndex1],
      type: type,
      onSelect: (title) => onFilterContentSelect1(title, selectIndex1 == 2),
      onCancel: onFilterContentCancel,
      onSubmit: onFilterContentSubmit,
    );

    double toTop = 56.0 + 40;
    if (PlatformUtils.isWeb) {
      toTop -= 16;
    }
    return VooFilterView(
      offset: Offset(0, toTop),
      close: filterMaskClose1,
      child: child,
    );
  }

  //筛选视图
  Widget filterView2() {
    if (selectIndex2 == null) return SizedBox.shrink();

    Widget child = VooFilterContent(
      filterContentList: filterContentList2[selectIndex2],
      type: VooFilterContentType.list,
      onSelect: onFilterContentSelect2,
    );
    double toTop = 56.0 + 40 + 56 + 40;
    if (PlatformUtils.isWeb) {
      toTop -= 16;
    }
    return VooFilterView(
      offset: Offset(0, toTop),
      close: filterMaskClose2,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];
    children.add(contentView());

    children.add(filterView1());
    children.add(filterView2());

    return Scaffold(
      appBar: UiComponent.getTitleBar(title: 'FilterPreview'),
      body: Stack(children: children),
    );
  }

  //筛选-tab-选择
  void onSelectTabTap1(int index) {
    selectIndex1 = index;
    filterTabList1.forEach((element) {
      element.select = filterTabList1.indexOf(element) == index;
    });
    setState(() {});
  }

  //筛选-内容-选择
  void onFilterContentSelect1(String title, bool selectMore) {
    if (selectMore) {
      VooFilterBean tempBean = filterContentList1[selectIndex1].firstWhere(
        (element) => element.title == title,
        orElse: () => null,
      );
      tempBean?.select = !(tempBean?.select ?? false);

      List<VooFilterBean> tempList = filterContentList1[selectIndex1].where((element) => element.select).toList();
      String tempFilterTabTitle = '';
      if (tempList.length == 0) {
        switch (selectIndex1) {
          case 0:
            tempFilterTabTitle = '位置';
            break;
          case 1:
            tempFilterTabTitle = '预算';
            break;
          case 2:
            tempFilterTabTitle = '风格';
            break;
        }
      } else {
        tempFilterTabTitle = tempList?.map((e) => e.title)?.toList()?.join(',');
      }
      filterTabList1[selectIndex1].title = tempFilterTabTitle;
      setState(() {});
    } else {
      filterTabList1[selectIndex1].title = title;
      filterContentList1[selectIndex1].forEach((element) {
        element.select = element.title == title;
      });
      filterMaskClose1();
    }
  }

  //筛选-内容-取消
  void onFilterContentCancel() {
    filterMaskClose1();
  }

  //筛选-内容-确定
  void onFilterContentSubmit() {
    filterMaskClose1();
  }

  //筛选-蒙版-关闭
  void filterMaskClose1() {
    selectIndex1 = null;
    filterTabList1.forEach((element) {
      element.select = false;
    });
    setState(() {});
  }

  //筛选-tab-选择
  void onSelectTabTap2(int index) {
    selectIndex2 = index;
    filterTabList2.forEach((element) {
      element.select = filterTabList2.indexOf(element) == index;
    });
    setState(() {});
  }

  //筛选-内容-选择
  void onFilterContentSelect2(String title) {
    filterTabList2[selectIndex2].title = title;
    filterContentList2[selectIndex2].forEach((element) {
      element.select = element.title == title;
    });
    filterMaskClose2();
  }

  //筛选-蒙版-关闭
  void filterMaskClose2() {
    selectIndex2 = null;
    filterTabList2.forEach((element) {
      element.select = false;
    });
    setState(() {});
  }
}

