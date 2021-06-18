import 'package:example/page/home/index.dart';
import 'package:example/page/hot_label/index.dart';
import 'package:example/page/label/index.dart';
import 'package:flutter/material.dart';
import 'package:example/page/avatar/index.dart';
import 'package:example/page/badge/index.dart';
import 'package:example/page/bubble/index.dart';
import 'package:example/page/bubble/index2.dart';
import 'package:example/page/button/index2.dart';
import 'package:example/page/collapse/index.dart';
import 'package:example/page/dialog/index.dart';
import 'package:example/page/error/index.dart';
import 'package:example/page/field/index.dart';
import 'package:example/page/filter/index.dart';
import 'package:example/page/guide/index.dart';
import 'package:example/page/icon/index.dart';
import 'package:example/page/list/index.dart';
import 'package:example/page/notify/index.dart';
import 'package:example/page/result/index.dart';
import 'package:example/page/search_bar/index.dart';
import 'package:example/page/switcher/index.dart';
import 'package:example/page/tabbar/index.dart';
import 'package:example/page/terms/index.dart';
import 'package:example/page/text/index.dart';
import 'package:example/page/toast/index.dart';
import 'package:example/page/bottomsheet/index.dart';
import 'package:example/page/button/index.dart';
import 'package:example/page/cell/index.dart';
import 'package:example/page/checkbox/index.dart';
import 'package:example/page/color/index.dart';
import 'package:example/page/layout/index.dart';
import 'package:example/page/loading/index.dart';
import 'package:example/page/nav_bar/index.dart';
import 'package:example/page/picker/picker.dart';
import 'package:example/page/popup/index.dart';
import 'package:example/page/radio/index.dart';
import 'package:example/page/style/index.dart';

Map<String, WidgetBuilder> routs = {
  '/': (context) => HomePage(),
  '/ColorPage': (context) => ColorPage(),
  '/IconPage': (context) => IconPage(),
  '/NavBarPage': (context) => NavBarPage(),
  '/ButtonPage': (context) => ButtonPage(),
  '/TermsPage': (context) => TermsPage(),
  '/FilterPage': (context) => FilterPage(),
  '/PickerPage': (context) => PickerPage(),
  '/ListPage': (context) => ListPage(),
  '/CollapsePage': (context) => CollapsePage(),
  '/AvatarPage': (context) => AvatarPage(),
  '/SearchBarPage': (context) => SearchBarPage(),
  '/BadgePage': (context) => BadgePage(),
  '/DialogPage': (context) => DialogPage(),
  '/BottomSheetPage': (context) => BottomSheetPage(),
  '/ToastPage': (context) => ToastPage(),
  '/ResultPage': (context) => ResultPage(),
  '/ErrorPage': (context) => ErrorPage(),
  '/GuidePage': (context) => GuidePage(),
  '/StylePage': (context) => StylePage(),
  '/LayoutPage': (context) => LayoutPage(),
  '/AnimatedButtonPage': (context) => AnimatedButtonPage(),
  '/ExpandableTextPage': (context) => ExpandableTextPage(),
  '/CellPage': (context) => CellPage(),
  '/BubbleBoxPage': (context) => BubbleBoxPage(),
  '/BubbleBoxPage2': (context) => BubbleBoxPage2(),
  '/PopupPage': (context) => PopupPage(),
  '/LoadingPage': (context) => LoadingPage(),
  '/NotifyPage': (context) => NotifyPage(),
  '/CheckBoxPage': (context) => CheckBoxPage(),
  '/FieldPage': (context) => FieldPage(),
  '/RadioPage': (context) => RadioPage(),
  '/StateSwitcherPage': (context) => StateSwitcherPage(),
  '/TabBarPage': (context) => TabBarPage(),
  '/LabelPage': (context) => LabelPage(),
  '/HotLabelView': (context) => HotLabelView(),
};
