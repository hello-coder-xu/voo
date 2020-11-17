import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef OnRetry = void Function();
typedef OnStateChanged = Widget Function(PageState state);

enum PageState {
  none,
  loading, // 加载中
  empty, // 空数据页面
  error, // 错误页面
  content, // 数据内容
  netError, // 网络错误
}

class StateSwitcher extends StatefulWidget {
  /// 页面状态
  final PageState pageState;

  /// 重试回调
  final OnRetry onRetry;

  /// 骨架屏
  final Widget skeleton;

  /// 空页面
  final Widget emptyView;

  /// 错误页面
  final Widget errorView;

  /// 子组件
  final Widget child;

  const StateSwitcher({
    Key key,
    this.pageState,
    this.onRetry,
    this.skeleton,
    this.emptyView,
    this.errorView,
    this.child,
  }) : super(key: key);

  @override
  _StateSwitcherState createState() => _StateSwitcherState();
}

class _StateSwitcherState extends State<StateSwitcher> {
  PageState _pageState = PageState.none;

  @override
  void initState() {
    super.initState();
    _pageState = widget.pageState;
  }

  @override
  void didUpdateWidget(StateSwitcher oldWidget) {
    super.didUpdateWidget(oldWidget);
    _pageState = widget.pageState;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: renderStatePage(_pageState),
    );
  }

  /// 根据状态值渲染对应的页面
  Widget renderStatePage(PageState pageState) {
    switch (pageState) {

      /// 加载中...
      case PageState.loading:
        if (widget.skeleton != null) {
          return widget.skeleton;
        }
        return Container(
          color: Colors.white,
          alignment: Alignment.center,
          child: _getIndicator(context),
        );

      /// 空页面
      case PageState.empty:
        if (widget.emptyView != null) return widget.emptyView;
        return InkWell(
          onTap: () {
            setState(() => _pageState = PageState.loading);
            widget.onRetry?.call();
          },
          child: getStatePage(
            image: Image.asset(
              "assets/error_page/empty_data.png",
              package: "voo",
              width: 310,
              height: 175,
              fit: BoxFit.contain,
            ),
            text: "暫無數據",
          ),
        );

      /// 错误页面
      case PageState.error:
        if (widget.errorView != null) return widget.errorView;
        return InkWell(
          onTap: () {
            setState(() => _pageState = PageState.loading);
            widget.onRetry?.call();
          },
          child: getStatePage(
            image: Image.asset(
              "assets/error_page/sys_error.png",
              package: "voo",
              width: 310,
              height: 210,
              fit: BoxFit.contain,
            ),
            text: "請求錯誤，請重試",
          ),
        );

      /// 正常内容页面
      default:
        return widget.child;
    }
  }

  /// 加载中
  Widget _getIndicator(BuildContext context) {
    return Theme.of(context).platform == TargetPlatform.iOS
        ? CupertinoActivityIndicator(
            animating: true,
            radius: 16.0,
          )
        : CircularProgressIndicator(
            strokeWidth: 2.0,
            valueColor: AlwaysStoppedAnimation(Theme.of(context).primaryColor),
          );
  }

  Widget getStatePage({Widget image, String text}) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          image,
          SizedBox(height: 15),
          Text(
            text,
            style: TextStyle(color: Color(0xFF999999), fontSize: 16),
          ),
        ],
      ),
    );
  }
}
