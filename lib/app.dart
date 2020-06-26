import 'package:total/page/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:total/common/global_variable.dart';
import 'package:total/model/tabbar_model.dart';
import 'package:total/util/tools.dart';
import 'package:total/widget/root_tabbar.dart';
import 'package:nav_router/nav_router.dart';
import 'page/third/third_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navGK,
      title: 'total',
      theme: ThemeData(
        hintColor: Colors.grey.withOpacity(0.3),
        splashColor: Colors.transparent,
        scaffoldBackgroundColor: Color.fromRGBO(243, 243, 243, 1),
        tabBarTheme: TabBarTheme(
          unselectedLabelColor: Color(0xff333333),
          labelColor: Color(0xff333333),
        ),
        indicatorColor: THEME_COLOR,
        primaryColor: themeColor,
      ),
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => RootPage(),
      },
    );
  }
}

class RootPage extends StatefulWidget {
  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  List<TabBarModel> pages() {
    return [
      new TabBarModel(
        title: '组件',
        icon: new Image.asset('assets/images/tab/tab_business_c.webp', width: 20.9),
        selectIcon:
        new Image.asset('assets/images/tab/tab_business_s.webp', width: 20.9),
        page: new ThirdPage(),
      ),
      new TabBarModel(
        title: '页面',
        icon: new Image.asset('assets/images/tab/tab_home_c.webp', width: 20.9),
        selectIcon:
        new Image.asset('assets/images/tab/tab_home_s.webp', width: 20.9),
        page: new HomePage(),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new RootTabBar(pages: pages(), currentIndex: 0),
//      body: new CacheWidget(JHActions.isLogin(), (v) {
//        return v
//            ? new RootTabBar(pages: pages(), currentIndex: 0)
//            : new LoginPage();
//      }),
    );
  }
}
