import 'package:flutter/material.dart';

class UiComponent {
  static Widget toWidget({dynamic title}) {
    if (title is Widget) {
      return title;
    }
    return Text('$title');
  }

  static AppBar getTitleBar({dynamic title}) {
    return AppBar(
      title: toWidget(title: title),
      centerTitle: true,
    );
  }

  static ListTile getListTile({dynamic title, dynamic subTitle}) {
    return ListTile(
      title: toWidget(title: title),
      subtitle: subTitle,
    );
  }
}
