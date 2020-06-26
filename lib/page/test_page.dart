import 'package:total/api/test/test_model.dart';
import 'package:total/api/test/test_view_model.dart';
import 'package:total/util/tools.dart';
import 'package:total/widget_common/bar/navigation_bar.dart';
import 'package:total/widget_common/data/data_view.dart';
import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  List _dataList = new List();
  bool isLoadingOk = false;
  bool isStart = false;
  int goPage = 1;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new NavigationBar(
        title: '测试页面',
      ),
      body: !isStart
          ? new Center(
              child: new RaisedButton(
                onPressed: () => getMissionList(true),
                child: new Text('Test'),
              ),
            )
          : new DataView(
              isLoadingOk: isLoadingOk,
              data: _dataList,
              onRefresh: () => getMissionList(true),
              onLoad: () {
                goPage++;
                return getMissionList();
              },
              child: new ListView(
                children: _dataList.map((item) {
                  ListResponseModel model = item;
                  return new Column(
                    children: <Widget>[
                      new ListTile(
                        leading: Icon(Icons.hourglass_empty),
                        title: new Text('${model?.title ?? '未知标题'}'),
                        onTap: () {},
                      ),
                      new Space(),
                      new Row(
                        children: <Widget>[
                          new Space(),
                          new Text('这是内容'),
                          new Spacer(),
                          new Text('这是内容'),
                          new Space(),
                        ],
                      ),
                      new Space(),
                      new Space(),
                    ],
                  );
                }).toList(),
              ),
            ),
    );
  }

  /// 分页获取所有任务
  Future getMissionList([bool isInit = false]) {
    if (isInit) goPage = 1;
    return TestViewModel()
        .missionList(
      context,
      page: goPage,
      limit: 10,
    )
        .then((rep) {
      setState(() {
        if (goPage == 1) {
          _dataList = List.from(rep.data);
        } else {
          _dataList.addAll(List.from(rep.data));
        }
        isStart = true;
        isLoadingOk = true;
      });
    }).catchError((e) {
      showToast(context, e.message);
    });
  }

  /// 最新任务
  void getDataList() {
    TestViewModel()
        .newMission(
      context,
    )
        .then((rep) {
      setState(() {
        _dataList = List.from(rep.data);
      });
    }).catchError((e) {
      showToast(context, e.message);
    });
  }

  /// 重设密码
  void resetPasswordHandle() {
    testViewModel
        .resetPassword(
      context,
      firstPassword: 'a1111111',
      secondPassword: 'a1111111',
      mobile: '18826987045',
    )
        .catchError((e) {
      showToast(context, e.message.toString());
    });
  }
}
