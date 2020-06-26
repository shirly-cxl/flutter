import 'package:flutter/material.dart';
import 'package:total/data/data.dart';
import 'package:total/model/tabbar_model.dart';
import 'package:total/util/tools.dart';

typedef CheckLogin(int index);

class RootTabBar extends StatefulWidget {
  RootTabBar({
    this.pages,
    this.checkLogin,
    this.currentIndex = 0,
  });

  final List<TabBarModel> pages;
  final CheckLogin checkLogin;
  final int currentIndex;

  @override
  State<StatefulWidget> createState() => new RootTabBarState();
}

class RootTabBarState extends State<RootTabBar> {
  int currentIndex;

  @override
  void initState() {
    super.initState();

    currentIndex = widget.currentIndex;

    Notice.addListener(JHActions.toTabBarIndex(), (index) {
      setState(() => currentIndex = index);
    });
  }

  BottomNavigationBarItem itemBuild(item) {
    TabBarModel model = item;
    return new BottomNavigationBarItem(
      icon: model.icon,
      activeIcon: model.selectIcon,
      title: new Text(model.title, style: new TextStyle(fontSize: 12.0)),
    );
  }

  BottomNavigationBar bottomNavigationBar() {
    return new BottomNavigationBar(
      items: widget.pages.map(itemBuild).toList(),
      type: BottomNavigationBarType.fixed,
      currentIndex: currentIndex,
      fixedColor: Color(0xffE1B96B),
      unselectedItemColor: Colors.white,
      backgroundColor: Color(0xff333333),
      onTap: (int index) async {
        if (widget.checkLogin != null) {
          widget.checkLogin(index);
          //限制登录写法
//        } else if (index == 4 && !JHData.isLogin()) {
//          routePush(LoginPage());
        } else {
          setState(() => currentIndex = index);
          Notice.send(JHActions.toTab(index), 'refresh');
        }
      },
      iconSize: 18.0,
    );
  }

  Widget pageBuild(item) {
    TabBarModel model = item;
    return model.page;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      bottomNavigationBar: bottomNavigationBar(),
//      body: widget.pages[currentIndex].page,
      body: new IndexedStack(
        index: currentIndex,
        children: widget.pages.map(pageBuild).toList(),
      ),
    );
  }
}
