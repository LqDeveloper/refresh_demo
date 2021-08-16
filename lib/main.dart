import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:refresh_demo/generated/l10n.dart';
import 'package:refresh_demo/joke_view_model.dart';

void main() {
  runZonedGuarded(() {
    WidgetsFlutterBinding.ensureInitialized();
    FlutterError.onError = (FlutterErrorDetails details) {};
    runApp(MyApp());
  }, (Object exception, StackTrace stack) {});
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RefreshConfiguration(
        headerBuilder: () => ClassicHeader(),
        footerBuilder: () => ClassicFooter(),
        shouldFooterFollowWhenNotFull: (state) {
          return false;
        },
        enableLoadingWhenFailed: true,
        enableLoadingWhenNoData: true,
        hideFooterWhenNotFull: true,
        child: MaterialApp(
          supportedLocales: S.delegate.supportedLocales,
          localizationsDelegates: [
            RefreshLocalizations.delegate,
            S.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalMaterialLocalizations.delegate
          ],
          theme: ThemeData(primaryColor: Colors.blue),
          debugShowCheckedModeBanner: false,
          initialRoute: 'main',
          onGenerateRoute: (setting) {
            switch (setting.name) {
              case 'main':
                return CupertinoPageRoute(builder: (_) {
                  return MainWidget();
                });
              default:
                return CupertinoPageRoute(builder: (context) {
                  return Center(
                    child: Text('当前组件没有实现'),
                  );
                });
            }
          },
        ));
  }
}

/*
*   const SliverAppBar({
    Key key,
    this.leading,//左侧的图标或文字，多为返回箭头
    this.automaticallyImplyLeading = true,//没有leading为true的时候，默认返回箭头，没有leading且为false，则显示title
    this.title,//标题
    this.actions,//标题右侧的操作
    this.flexibleSpace,//可以理解为SliverAppBar的背景内容区
    this.bottom,//SliverAppBar的底部区
    this.elevation,//阴影
    this.forceElevated = false,//是否显示阴影
    this.backgroundColor,//背景颜色
    this.brightness,//状态栏主题，默认Brightness.dark，可选参数light
    this.iconTheme,//SliverAppBar图标主题
    this.actionsIconTheme,//action图标主题
    this.textTheme,//文字主题
    this.primary = true,//是否显示在状态栏的下面,false就会占领状态栏的高度
    this.centerTitle,//标题是否居中显示
    this.titleSpacing = NavigationToolbar.kMiddleSpacing,//标题横向间距
    this.expandedHeight,//合并的高度，默认是状态栏的高度加AppBar的高度
    this.floating = false,//滑动时是否悬浮
    this.pinned = false,//标题栏是否固定
    this.snap = false,//配合floating使用
  })

* */

class MainWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainState();
  }
}

class _MainState extends State<MainWidget> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => JokeViewModel(),
      child: SafeArea(
          top: false,
          bottom: false,
          child: Scaffold(
            body: Consumer<JokeViewModel>(
              builder: (context, jokeViewModel, child) {
                return SmartRefresher(
                  controller: jokeViewModel.controller,
                  onRefresh: jokeViewModel.refreshData,
                  onLoading: jokeViewModel.loadData,
                  child: CustomScrollView(
                    physics: BouncingScrollPhysics(),
                    slivers: [
                      SliverAppBar(
                        expandedHeight: 300,
                        pinned: true,
                        snap: true,
                        floating: true,
                        title: const Text('这是SliverAppBar'),
                        flexibleSpace: FlexibleSpaceBar(
                          background: Image.asset(
                            'assets/image.jpg',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      SliverPadding(
                        padding: EdgeInsets.zero,
                        sliver: SliverFixedExtentList(
                          delegate: SliverChildBuilderDelegate(
                              (BuildContext context, int index) {
                            return Container(
                              alignment: Alignment.center,
                              child: Text('${jokeViewModel.list[index].name}'),
                            );
                          }, childCount: jokeViewModel.list.length),
                          itemExtent: 60,
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          )),
    );
  }
}
