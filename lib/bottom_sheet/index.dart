import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:voo/picker/picker_bean.dart';
import 'package:voo/picker/picker_linkage_bean.dart';
import 'package:voo/picker/voo_linkage_picker.dart';
import 'package:voo/picker/voo_picker.dart';

class VooBottomGridBean {
  Widget icon;
  String title;
  TextStyle style;

  VooBottomGridBean({this.icon, this.title, this.style});
}

class VooBottomSheet {
  //底部菜单-列表
  static Future showListView({
    @required BuildContext context,
    List<String> list,
    Color backgroundColor,
    double elevation,
    ShapeBorder shape,
    Clip clipBehavior,
    Color barrierColor,
    bool isScrollControlled = false,
    bool useRootNavigator = false,
    bool isDismissible = true,
    bool enableDrag = true,
    RouteSettings routeSettings,
    bool isTopRound = false,
    Function(String value) onSelect,
    VoidCallback onCancel,
  }) {
    WidgetBuilder builder = (context) => VBottomSheetOptionView(
          list: list,
          onSelect: onSelect,
          onCancel: onCancel,
        );
    return _show(
      context: context,
      builder: builder,
      backgroundColor: backgroundColor,
      elevation: elevation,
      shape: shape ?? isTopRound
          ? RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(ScreenUtil().setWidth(25)),
              ),
            )
          : null,
      clipBehavior: clipBehavior,
      barrierColor: barrierColor,
      isScrollControlled: isScrollControlled,
      useRootNavigator: useRootNavigator,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      routeSettings: routeSettings,
    );
  }

  static Future showDescribeView({
    @required BuildContext context,
    @required Widget child,
    Color backgroundColor,
    double elevation,
    ShapeBorder shape,
    Clip clipBehavior,
    Color barrierColor,
    bool isScrollControlled = false,
    bool useRootNavigator = false,
    bool isDismissible = true,
    bool enableDrag = true,
    RouteSettings routeSettings,
    bool isTopRound = false,
    VoidCallback onDelete,
    VoidCallback onCancel,
  }) {
    WidgetBuilder builder = (context) => VBottomSheetTextView(
          child: child,
          onDelete: onDelete,
          onCancel: onCancel,
        );
    return _show(
      context: context,
      builder: builder,
      backgroundColor: backgroundColor,
      elevation: elevation,
      shape: shape ?? isTopRound
          ? RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(ScreenUtil().setWidth(25)),
              ),
            )
          : null,
      clipBehavior: clipBehavior,
      barrierColor: barrierColor,
      isScrollControlled: isScrollControlled,
      useRootNavigator: useRootNavigator,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      routeSettings: routeSettings,
    );
  }

  static Future showGridView({
    @required BuildContext context,
    @required List<VooBottomGridBean> list,
    double spacing,
    double runSpacing,
    Alignment alignment,
    Color backgroundColor,
    double elevation,
    ShapeBorder shape,
    Clip clipBehavior,
    Color barrierColor,
    bool isScrollControlled = false,
    bool useRootNavigator = false,
    bool isDismissible = true,
    bool enableDrag = true,
    RouteSettings routeSettings,
    bool isTopRound = false,
    Function(int index) onSelect,
    VoidCallback onCancel,
  }) {
    WidgetBuilder builder = (context) => VBottomSheetGridView(
          list: list,
          spacing: spacing,
          runSpacing: runSpacing,
          onSelect: onSelect,
          alignment: alignment,
        );
    return _show(
      context: context,
      builder: builder,
      backgroundColor: backgroundColor,
      elevation: elevation,
      shape: shape ?? isTopRound
          ? RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(ScreenUtil().setWidth(25)),
              ),
            )
          : null,
      clipBehavior: clipBehavior,
      barrierColor: barrierColor,
      isScrollControlled: isScrollControlled,
      useRootNavigator: useRootNavigator,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      routeSettings: routeSettings,
    );
  }

  static Future showPicker({
    @required BuildContext context,
    String title,
    String cancelTxt,
    String confirmTxt,
    TextStyle style,
    TextStyle confirmStyle,
    TextStyle cancelStyle,
    List<PickerBean> list,
    VoidCallback onCancel,
    Function(String value) onConfirm,
    Color backgroundColor,
    double elevation,
    ShapeBorder shape,
    Clip clipBehavior,
    Color barrierColor,
    bool isScrollControlled = false,
    bool useRootNavigator = false,
    bool isDismissible = true,
    bool enableDrag = true,
    RouteSettings routeSettings,
  }) {
    WidgetBuilder builder = (context) => VooPicker(
          title: title,
          cancelTxt: cancelTxt,
          confirmTxt: confirmTxt,
          style: style,
          confirmStyle: confirmStyle,
          cancelStyle: cancelStyle,
          list: list,
          onCancel: onCancel,
          onConfirm: onConfirm,
        );
    return _show(
      context: context,
      builder: builder,
      backgroundColor: backgroundColor,
      elevation: elevation,
      clipBehavior: clipBehavior,
      barrierColor: barrierColor,
      isScrollControlled: isScrollControlled,
      useRootNavigator: useRootNavigator,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      routeSettings: routeSettings,
    );
  }

  static Future showLinkagePicker({
    @required BuildContext context,
    String title,
    String cancelTxt,
    String confirmTxt,
    TextStyle style,
    TextStyle confirmStyle,
    TextStyle cancelStyle,
    PickerLinkageBean bean,
    VoidCallback onCancel,
    Function(String value) onConfirm,
    Color backgroundColor,
    double elevation,
    ShapeBorder shape,
    Clip clipBehavior,
    Color barrierColor,
    bool isScrollControlled = false,
    bool useRootNavigator = false,
    bool isDismissible = true,
    bool enableDrag = true,
    RouteSettings routeSettings,
  }) {
    WidgetBuilder builder = (context) => VooLinkagePicker(
      title: title,
      cancelTxt: cancelTxt,
      confirmTxt: confirmTxt,
      style: style,
      confirmStyle: confirmStyle,
      cancelStyle: cancelStyle,
      bean: bean,
      onCancel: onCancel,
      onConfirm: onConfirm,
    );
    return _show(
      context: context,
      builder: builder,
      backgroundColor: backgroundColor,
      elevation: elevation,
      clipBehavior: clipBehavior,
      barrierColor: barrierColor,
      isScrollControlled: isScrollControlled,
      useRootNavigator: useRootNavigator,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      routeSettings: routeSettings,
    );

  }

  static Future _show({
    @required BuildContext context,
    WidgetBuilder builder,
    Color backgroundColor,
    double elevation,
    ShapeBorder shape,
    Clip clipBehavior,
    Color barrierColor,
    bool isScrollControlled = false,
    bool useRootNavigator = false,
    bool isDismissible = true,
    bool enableDrag = true,
    RouteSettings routeSettings,
  }) {
    return showModalBottomSheet(
      context: context,
      builder: builder,
      backgroundColor: backgroundColor,
      elevation: elevation,
      shape: shape,
      clipBehavior: clipBehavior,
      barrierColor: barrierColor,
      isScrollControlled: isScrollControlled,
      useRootNavigator: useRootNavigator,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      routeSettings: routeSettings,
    );
  }
}

///列表选择视图
class VBottomSheetOptionView extends StatelessWidget {
  final List<String> list;
  final String initData;
  final double maxHeight;
  final double minHeight;
  final Function(String value) onSelect;
  final Function onCancel;

  VBottomSheetOptionView({
    this.list,
    this.initData,
    this.maxHeight = 0.8,
    this.minHeight = 0.1,
    this.onSelect,
    this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];
    children.add(contentView(context));
    children.add(bottomView(context));

    return IntrinsicHeight(child: Column(children: children));
  }

  Widget contentView(BuildContext context) {
    List<Widget> children = [];

    for (int i = 0; i < list.length; i++) {
      if (children.length > 0) {
        children.add(Divider(height: 1));
      }
      String it = list[i];
      children.add(GestureDetector(
        onTap: () => onItemClick(context, it),
        behavior: HitTestBehavior.translucent,
        child: Container(
          height: ScreenUtil().setHeight(96),
          alignment: Alignment.center,
          child: Text(
            it,
            style: TextStyle(
              fontSize: ScreenUtil().setSp(36),
              color: Color(0xff333333),
            ),
          ),
        ),
      ));
    }

    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * maxHeight,
        minHeight: MediaQuery.of(context).size.height * minHeight,
      ),
      child: SingleChildScrollView(
        child: Column(children: children),
      ),
    );
  }

  Widget bottomView(BuildContext context) {
    List<Widget> children = [];
    children.add(Container(
      height: ScreenUtil().setHeight(24),
      color: Color(0xffE5E5E5),
    ));

    children.add(GestureDetector(
      onTap: () => onCancelTap(context),
      child: Container(
        height: ScreenUtil().setHeight(96),
        alignment: Alignment.center,
        color: Colors.white,
        child: Text(
          '取消',
          style: TextStyle(
            fontSize: ScreenUtil().setSp(32),
            color: Color(0xff333333),
          ),
        ),
      ),
    ));

    return Column(children: children);
  }

  void onItemClick(BuildContext context, String value) {
    if (onSelect != null) {
      onSelect(value);
    }
    close(context);
  }

  void onCancelTap(BuildContext context) {
    if (onCancel != null) {
      onCancel();
    }
    close(context);
  }

  void close(BuildContext context) {
    Navigator.pop(context);
  }
}

///文本视图
class VBottomSheetTextView extends StatelessWidget {
  final Widget child;
  final double maxHeight;
  final double minHeight;
  final VoidCallback onDelete;
  final VoidCallback onCancel;

  VBottomSheetTextView({
    this.child,
    this.maxHeight = 0.8,
    this.minHeight = 0.1,
    this.onDelete,
    this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];

    children.add(Container(
      padding: EdgeInsets.symmetric(
        vertical: ScreenUtil().setHeight(40),
        horizontal: ScreenUtil().setWidth(32),
      ),
      color: Colors.white,
      child: DefaultTextStyle(
        style: TextStyle(
          fontSize: ScreenUtil().setSp(32),
          color: Color(0xff333333),
        ),
        child: child,
      ),
    ));
    children.add(Divider(height: 1));
    children.add(GestureDetector(
      onTap: () => onDeleteTap(context),
      child: Container(
        height: ScreenUtil().setHeight(96),
        alignment: Alignment.center,
        color: Colors.white,
        child: Text(
          '刪除',
          style: TextStyle(
            fontSize: ScreenUtil().setSp(32),
            color: Colors.red,
          ),
        ),
      ),
    ));

    children.add(Container(
      height: ScreenUtil().setHeight(24),
      color: Color(0xffE5E5E5),
    ));

    children.add(GestureDetector(
      onTap: () => onCancelTap(context),
      child: Container(
        height: ScreenUtil().setHeight(96),
        alignment: Alignment.center,
        color: Colors.white,
        child: Text(
          '取消',
          style: TextStyle(
            fontSize: ScreenUtil().setSp(32),
            color: Color(0xff333333),
          ),
        ),
      ),
    ));

    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * maxHeight,
        minHeight: MediaQuery.of(context).size.height * minHeight,
      ),
      child: IntrinsicHeight(child: Column(children: children)),
    );
  }

  void onDeleteTap(BuildContext context) {
    if (onDelete != null) {
      onDelete();
    }
    close(context);
  }

  void onCancelTap(BuildContext context) {
    if (onCancel != null) {
      onCancel();
    }
    close(context);
  }

  void close(BuildContext context) {
    Navigator.pop(context);
  }
}

///自定义视图
class VBottomSheetGridView extends StatelessWidget {
  final List<VooBottomGridBean> list;
  final double maxHeight;
  final double minHeight;
  final double spacing;
  final double runSpacing;
  final Alignment alignment;
  final VoidCallback onCancel;
  final Function(int index) onSelect;

  VBottomSheetGridView({
    this.list,
    this.maxHeight = 0.8,
    this.minHeight = 0.1,
    this.spacing,
    this.runSpacing,
    this.alignment,
    this.onCancel,
    this.onSelect,
  });

  Widget gridView(BuildContext context) {
    List<Widget> children = [];
    list.forEach((element) {
      children.add(GestureDetector(
        onTap: () => onSelectTap(context, list.indexOf(element)),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: ScreenUtil().setWidth(112),
                height: ScreenUtil().setWidth(112),
                child: element.icon,
                alignment: Alignment.center,
              ),
              SizedBox(height: ScreenUtil().setHeight(24)),
              Text(
                element.title,
                style: element.style ??
                    TextStyle(
                      fontSize: ScreenUtil().setSp(28),
                      color: Color(0xff333333),
                    ),
              ),
            ],
          ),
        ),
      ));
    });

    return Container(
      constraints: BoxConstraints(minHeight: ScreenUtil().setHeight(258)),
      padding: EdgeInsets.all(ScreenUtil().setHeight(40)),
      color: Colors.white,
      alignment: alignment ?? Alignment.bottomLeft,
      child: Wrap(
        children: children,
        spacing: spacing ?? ScreenUtil().setWidth(40),
        runSpacing: runSpacing ?? ScreenUtil().setWidth(40),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];

    children.add(gridView(context));

    children.add(Container(
      height: ScreenUtil().setHeight(24),
      color: Color(0xffE5E5E5),
    ));

    children.add(GestureDetector(
      onTap: () => onCancelTap(context),
      child: Container(
        height: ScreenUtil().setHeight(96),
        alignment: Alignment.center,
        color: Colors.white,
        child: Text(
          '取消',
          style: TextStyle(
            fontSize: ScreenUtil().setSp(32),
            color: Color(0xff333333),
          ),
        ),
      ),
    ));

    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * maxHeight,
        minHeight: MediaQuery.of(context).size.height * minHeight,
      ),
      child: IntrinsicHeight(child: Column(children: children)),
    );
  }

  void onCancelTap(BuildContext context) {
    if (onCancel != null) {
      onCancel();
    }
    close(context);
  }

  void onSelectTap(BuildContext context, int index) {
    if (onSelect != null) {
      onSelect(index);
    }
    close(context);
  }

  void close(BuildContext context) {
    Navigator.pop(context);
  }
}
