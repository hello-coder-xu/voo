import 'package:example/routes/index.dart';
import 'package:flutter/material.dart';
import 'package:voo/color/index.dart';

void main() {
  runApp(MaterialApp(
    title: 'voo Demo',
    theme: ThemeData(
      primaryColor: VooColors.primaryColor,
      accentColor: VooColors.accentColor,
      scaffoldBackgroundColor: VooColors.pageBgColor,
      appBarTheme: AppBarTheme(
        color: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: VooColors.primaryColor),
        textTheme: TextTheme(
          headline6: TextStyle(fontSize: 18, color: VooColors.titleColor),
          bodyText2: TextStyle(fontSize: 14, color: VooColors.lightTitleColor),
          subtitle2: TextStyle(fontSize: 14, color: VooColors.subTitleColor),
        ),
        actionsIconTheme: IconThemeData(color: VooColors.primaryColor),
      ),
      iconTheme: IconThemeData(color: VooColors.primaryColor),
      textTheme: TextTheme(
        headline6: TextStyle(fontSize: 18, color: VooColors.titleColor),
        bodyText2: TextStyle(fontSize: 14, color: VooColors.lightTitleColor),
        subtitle2: TextStyle(fontSize: 14, color: VooColors.subTitleColor),
      ),
    ),
    darkTheme: ThemeData(
      primaryColor: VooColors.pageBgColor,
      accentColor: VooColors.accentColor,
      scaffoldBackgroundColor: VooColors.primaryColor,
      appBarTheme: AppBarTheme(
        color: VooColors.primaryColor,
        elevation: 0,
        iconTheme: IconThemeData(color: VooColors.pageBgColor),
        textTheme: TextTheme(
          headline6: TextStyle(fontSize: 18, color: VooColors.unWhiteTitleColor),
          bodyText2: TextStyle(fontSize: 14, color: VooColors.darkTipColor),
          subtitle2: TextStyle(fontSize: 14, color: VooColors.unWhiteSubTitleColor),
        ),
        actionsIconTheme: IconThemeData(color: VooColors.pageBgColor),
      ),
      iconTheme: IconThemeData(color: VooColors.pageBgColor),
      textTheme: TextTheme(
        headline6: TextStyle(fontSize: 18, color: VooColors.unWhiteTitleColor),
        bodyText2: TextStyle(fontSize: 14, color: VooColors.darkTipColor),
        subtitle2: TextStyle(fontSize: 14, color: VooColors.unWhiteSubTitleColor),
      ),
    ),
    themeMode: ThemeMode.system,
    routes: routs,
  ));
}
