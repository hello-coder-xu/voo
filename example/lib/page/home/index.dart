import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:voo/color/index.dart';
import 'package:voo/voo.dart';

///首页
class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final List<Map<String, Map<String, String>>> list = [
    {
      '设计全局': {
        '颜色 Color': '/ColorPage',
        '图标-系统性 Icon': '/IconPage',
      },
      '导航栏': {
        '导航栏 NavigationBar': '/NavBarPage',
      },
      '信息输入': {
        '按钮 Button': '/ButtonPage',
        '输入框 Field': '/FieldPage',
        '协议 Terms': '/TermsPage',
        '下拉菜单 DropdownMenu': '/FilterPage',
        '选择器 Picker': '/PickerPage',
      },
      '信息展示': {
        '列表 List': '/ListPage',
        '折叠面板 Collapse': '/CollapsePage',
        '头像 Avatar': '/AvatarPage',
        '搜索框 SearchBar': '/SearchBarPage',
        '标签 Label': '/LabelPage',
        '热门 Label': '/HotLabelView',
      },
      '反馈': {
        '微标 Badge': '/BadgePage',
        '对话框 Dialog': '/DialogPage',
        '底部面板 BottomSheet': '/BottomSheetPage',
        '轻提示 Toast': '/ToastPage',
        '操作结果 Result': '/ResultPage',
        '异常 ErrorPage': '/ErrorPage',
        '蒙层引导 DemoGuide': '/GuidePage',
      },
      '基础组件': {
        '内置样式 Style': '/StylePage',
        '布局 Layout': '/LayoutPage',
        '100定制图标 Icons': '/IconPage',
        '按钮Button': '/ButtonPage',
        '动画按钮Button': '/AnimatedButtonPage',
        '可展开的Text': '/ExpandableTextPage',
        '单元格 Cell': '/CellPage',
        '头像 Avatar': '/AvatarPage',
        '100操作结果': '/ResultPage',
        '气泡框 （聊天页面）': '/BubbleBoxPage',
        '气泡框 （弹框）': '/BubbleBoxPage2',
      },
      '反馈组件': {
        '底部面板BottomSheet': '/BottomSheetPage',
        '弹出层 Popup': '/PopupPage',
        '加载 Loading': '/LoadingPage',
        '消息通知 Notify': '/NotifyPage',
        '弹出框 Dialog': '/DialogPage',
        '下拉菜单 DropdownMenu': '/FilterPage',
        '轻提示 Toast': '/ToastPage',
        '异常 ErrorPage': '/ErrorPage',
      },
      '表单组件': {
        '复选框 Checkbox': '/CheckBoxPage',
        '输入框 Field': '/FieldPage',
        '单选框 Radio': '/RadioPage',
        '折叠面板 Collapse': '/CollapsePage',
      },
      '导航组件': {
        '导航栏 NavBar': '/NavBarPage',
        '下拉菜单 DropdownMenu': '/FilterPage',
        '搜索框 SearchBar': '/SearchBarPage',
        '蒙层引导 DemoGuide': '/GuidePage',
        '页面状态切换 StateSwitcher': '/StateSwitcherPage',
        '导航栏 指示器 TabBar indicator': '/TabBarPage',
      },
    },
  ];

  ///标题视图
  Widget titleView() {
    List<Widget> children = [];
    children.add(Row(
      children: [
        Image.asset('assets/icon/100.png', width: 30, height: 30),
        SizedBox(width: 8),
        Text('Voo', style: TextStyle(fontSize: 32))
      ],
    ));
    children.add(Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(top: 8),
      child: Text(
        '100室内设计组件库',
        style: TextStyle(fontSize: 14, color: VooColors.subTitleColor),
      ),
    ));
    return Column(children: children);
  }

  ///内容视图
  Widget contentView(BuildContext context) {
    List<Widget> children = [];

    list.forEach((element) {
      element.forEach((title, map) {
        children.add(Container(
          margin: EdgeInsets.only(top: 16),
          alignment: Alignment.centerLeft,
          child: Text(title, style: TextStyle(fontSize: 14, color: VooColors.subTitleColor)),
        ));

        map.forEach((key, value) {
          children.add(GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, value);
            },
            child: Container(
              height: 40,
              margin: EdgeInsets.symmetric(vertical: 8),
              padding: EdgeInsets.symmetric(horizontal: 16),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: VooColors.cardBgColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(key, style: TextStyle(fontSize: 14, color: VooColors.titleColor)),
                  Icon(VooIcon.arrow_right, color: VooColors.subTitleColor, size: 16),
                ],
              ),
            ),
          ));
        });
      });
    });

    return Column(children: children);
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];
    children.add(titleView());
    children.add(SizedBox(height: 16));
    children.add(contentView(context));
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 48, left: 16, right: 16),
        child: Column(children: children),
      ),
    );
  }
}
