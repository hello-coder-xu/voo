import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:voo/picker/picker_bean.dart';
import 'package:voo/picker/picker_linkage_bean.dart';
import 'package:voo/picker/voo_linkage_picker.dart';
import 'package:voo/picker/voo_picker.dart';

class VooBottomGridBean {
  Widget? icon;
  String? title;
  TextStyle? style;

  VooBottomGridBean({this.icon, this.title, this.style});
}

class VooBottomSheet {
  ///底部菜单-列表
  static Future showListView({
    required BuildContext context,
    List<String>? list,
    Color? backgroundColor,
    double? elevation,
    ShapeBorder? shape,
    Clip? clipBehavior,
    Color? barrierColor,
    bool isScrollControlled = false,
    bool useRootNavigator = false,
    bool isDismissible = true,
    bool enableDrag = true,
    RouteSettings? routeSettings,
    bool isTopRound = false,
    Function(String value)? onSelect,
    VoidCallback? onCancel,
  }) {
    WidgetBuilder builder = (context) => VBottomSheetOptionView(
          list: list,
          onSelect: onSelect,
          onCancel: onCancel,
        );
    ShapeBorder? shape;
    if (isTopRound) {
      shape = RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.w),
        ),
      );
    }
    return _show(
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

  ///底部菜单-描述
  static Future showDescribeView({
    required BuildContext context,
    required Widget child,
    Color? backgroundColor,
    double? elevation,
    ShapeBorder? shape,
    Clip? clipBehavior,
    Color? barrierColor,
    bool isScrollControlled = false,
    bool useRootNavigator = false,
    bool isDismissible = true,
    bool enableDrag = true,
    RouteSettings? routeSettings,
    bool isTopRound = false,
    VoidCallback? onDelete,
    VoidCallback? onCancel,
  }) {
    WidgetBuilder builder = (context) => VBottomSheetTextView(
          child: child,
          onDelete: onDelete,
          onCancel: onCancel,
        );
    ShapeBorder? shape;
    if (isTopRound) {
      shape = RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.w),
        ),
      );
    }
    return _show(
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

  ///底部菜单-宫格
  static Future showGridView({
    required BuildContext context,
    required List<VooBottomGridBean> list,
    double? spacing,
    double? runSpacing,
    Alignment? alignment,
    Color? backgroundColor,
    double? elevation,
    ShapeBorder? shape,
    Clip? clipBehavior,
    Color? barrierColor,
    bool isScrollControlled = false,
    bool useRootNavigator = false,
    bool isDismissible = true,
    bool enableDrag = true,
    RouteSettings? routeSettings,
    bool isTopRound = false,
    Function(int index)? onSelect,
    VoidCallback? onCancel,
  }) {
    WidgetBuilder builder = (context) => VBottomSheetGridView(
          list: list,
          spacing: spacing,
          runSpacing: runSpacing,
          onSelect: onSelect,
          alignment: alignment,
        );
    ShapeBorder? shape;
    if (isTopRound) {
      shape = RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.w),
        ),
      );
    }
    return _show(
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

  ///底部菜单-picker
  static Future showPicker({
    required BuildContext context,
    String? title,
    String? cancelTxt,
    String? confirmTxt,
    TextStyle? style,
    TextStyle? confirmStyle,
    TextStyle? cancelStyle,
    List<PickerBean>? list,
    VoidCallback? onCancel,
    Function(String value)? onConfirm,
    Color? backgroundColor,
    double? elevation,
    ShapeBorder? shape,
    Clip? clipBehavior,
    Color? barrierColor,
    bool isScrollControlled = false,
    bool useRootNavigator = false,
    bool isDismissible = true,
    bool enableDrag = true,
    RouteSettings? routeSettings,
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

  ///底部菜单-联动picker
  static Future showLinkagePicker({
    required BuildContext context,
    String? title,
    String? cancelTxt,
    String? confirmTxt,
    TextStyle? style,
    TextStyle? confirmStyle,
    TextStyle? cancelStyle,
    PickerLinkageBean? bean,
    VoidCallback? onCancel,
    Function(String value)? onConfirm,
    Color? backgroundColor,
    double? elevation,
    ShapeBorder? shape,
    Clip? clipBehavior,
    Color? barrierColor,
    bool isScrollControlled = false,
    bool useRootNavigator = false,
    bool isDismissible = true,
    bool enableDrag = true,
    RouteSettings? routeSettings,
  }) {
    WidgetBuilder builder = (context) => VooLinkagePicker(
          title: title,
          cancelTxt: cancelTxt,
          confirmTxt: confirmTxt,
          style: style,
          confirmStyle: confirmStyle,
          cancelStyle: cancelStyle,
          bean: bean!,
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
    required BuildContext context,
    required WidgetBuilder builder,
    Color? backgroundColor,
    double? elevation,
    ShapeBorder? shape,
    Clip? clipBehavior,
    Color? barrierColor,
    bool isScrollControlled = false,
    bool useRootNavigator = false,
    bool isDismissible = true,
    bool enableDrag = true,
    RouteSettings? routeSettings,
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
  //列表数组
  final List<String>? list;

  //初始值
  final String? initData;

  //最大高度
  final double maxHeight;

  //最小高度
  final double minHeight;

  //选择事件
  final Function(String value)? onSelect;

  //取消事件
  final Function? onCancel;

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

    for (int i = 0; i < list!.length; i++) {
      if (children.length > 0) {
        children.add(Divider(height: 1));
      }
      String it = list![i];
      children.add(GestureDetector(
        onTap: () => onItemClick(context, it),
        behavior: HitTestBehavior.translucent,
        child: Container(
          height: 96.h,
          alignment: Alignment.center,
          child: Text(
            it,
            style: TextStyle(
              fontSize: 36.sp,
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
      height: 24.h,
      color: Color(0xffE5E5E5),
    ));

    children.add(GestureDetector(
      onTap: () => onCancelTap(context),
      child: Container(
        height: 96.h,
        alignment: Alignment.center,
        color: Colors.white,
        child: Text(
          '取消',
          style: TextStyle(
            fontSize: 32.sp,
            color: Color(0xff333333),
          ),
        ),
      ),
    ));

    return Column(children: children);
  }

  //item选中事件
  void onItemClick(BuildContext context, String value) {
    if (onSelect != null) {
      onSelect!(value);
    }
    close(context);
  }

  //取消事件
  void onCancelTap(BuildContext context) {
    if (onCancel != null) {
      onCancel!();
    }
    close(context);
  }

  //关闭弹框
  void close(BuildContext context) {
    Navigator.pop(context);
  }
}

///文本视图
class VBottomSheetTextView extends StatelessWidget {
  //显示内容
  final Widget? child;

  //最大高度
  final double maxHeight;

  //最小高度
  final double minHeight;

  //删除事件
  final VoidCallback? onDelete;

  //取消事件
  final VoidCallback? onCancel;

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
        vertical: 40.w,
        horizontal: 32.w,
      ),
      color: Colors.white,
      child: DefaultTextStyle(
        style: TextStyle(
          fontSize: 32.sp,
          color: Color(0xff333333),
        ),
        child: child!,
      ),
    ));
    children.add(Divider(height: 1));
    children.add(GestureDetector(
      onTap: () => onDeleteTap(context),
      child: Container(
        height: 96.w,
        alignment: Alignment.center,
        color: Colors.white,
        child: Text(
          '刪除',
          style: TextStyle(
            fontSize: 32.sp,
            color: Colors.red,
          ),
        ),
      ),
    ));

    children.add(Container(
      height: 24.h,
      color: Color(0xffE5E5E5),
    ));

    children.add(GestureDetector(
      onTap: () => onCancelTap(context),
      child: Container(
        height: 96.h,
        alignment: Alignment.center,
        color: Colors.white,
        child: Text(
          '取消',
          style: TextStyle(
            fontSize: 32.sp,
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

  //删除事件
  void onDeleteTap(BuildContext context) {
    if (onDelete != null) {
      onDelete!();
    }
    close(context);
  }

  //取消事件
  void onCancelTap(BuildContext context) {
    if (onCancel != null) {
      onCancel!();
    }
    close(context);
  }

  //关闭弹框
  void close(BuildContext context) {
    Navigator.pop(context);
  }
}

///自定义视图
class VBottomSheetGridView extends StatelessWidget {
  //内容数组
  final List<VooBottomGridBean>? list;

  //最大高度
  final double maxHeight;

  //最小高度
  final double minHeight;

  //水平间隔
  final double? spacing;

  //垂直间隔
  final double? runSpacing;

  //对齐方式
  final Alignment? alignment;

  //取消事件
  final VoidCallback? onCancel;

  //选择事件
  final Function(int index)? onSelect;

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
    list!.forEach((element) {
      children.add(GestureDetector(
        onTap: () => onSelectTap(context, list!.indexOf(element)),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 112.w,
                height: 112.w,
                child: element.icon,
                alignment: Alignment.center,
              ),
              SizedBox(height: 24.h),
              Text(
                element.title!,
                style: element.style ??
                    TextStyle(
                      fontSize: 28.sp,
                      color: Color(0xff333333),
                    ),
              ),
            ],
          ),
        ),
      ));
    });

    return Container(
      constraints: BoxConstraints(minHeight: 258.h),
      padding: EdgeInsets.all(40.h),
      color: Colors.white,
      alignment: alignment ?? Alignment.bottomLeft,
      child: Wrap(
        children: children,
        spacing: spacing ?? 40.w,
        runSpacing: runSpacing ?? 40.w,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];

    children.add(gridView(context));

    children.add(Container(
      height: 24.h,
      color: Color(0xffE5E5E5),
    ));

    children.add(GestureDetector(
      onTap: () => onCancelTap(context),
      child: Container(
        height: 96.h,
        alignment: Alignment.center,
        color: Colors.white,
        child: Text(
          '取消',
          style: TextStyle(
            fontSize: 32.sp,
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
      onCancel!();
    }
    close(context);
  }

  void onSelectTap(BuildContext context, int index) {
    if (onSelect != null) {
      onSelect!(index);
    }
    close(context);
  }

  void close(BuildContext context) {
    Navigator.pop(context);
  }
}
