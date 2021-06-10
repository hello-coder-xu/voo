import 'package:example/routes/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(750, 1334),
      builder: () => MaterialApp(
        title: 'voo Demo',
        routes: routs,
        onGenerateRoute: (settings) {
          WidgetBuilder builder = routs[settings.name];
          return MaterialPageRoute(builder: builder);
        },
      ),
    );
  }
}
