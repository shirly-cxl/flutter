import 'package:flutter/material.dart';
import 'package:total/util/tools.dart';
import 'package:total/widget/colud_whead_widget.dart';

class DayNightPage extends StatefulWidget {
  @override
  _DayNightPageState createState() => _DayNightPageState();
}

class _DayNightPageState extends State<DayNightPage>with TickerProviderStateMixin {
  AnimationController _controller;
  AnimationController controller;
  bool son = true;
  @override
  void initState() {
    super.initState();
    _controller =
    AnimationController(vsync: this, duration: new Duration(seconds: 2))
      ..repeat();
  }

  List dataOne = [
    {
      'milliseconds': 60000,
      'img': 'assets/images/cloud_3.png',
      'width': 15.0,
      'top': 20.0
    },
    {
      'milliseconds': 60000,
      'img': 'assets/images/cloud_2.png',
      'width': 30.0,
      'top': 35.0
    },
    {
      'milliseconds': 60000,
      'img': 'assets/images/cloud_1.png',
      'width': 70.0,
      'top': 45.0
    },
    {
      'milliseconds': 60000,
      'img': 'assets/images/cloud_4.png',
      'width': 45.0,
      'top': 87.0
    },
    {
      'milliseconds': 60000,
      'img': 'assets/images/cloud_5.png',
      'width': 33.0,
      'top': 148.0
    }
  ];

  List dataTwo = [
    [30.0, 90.0, 2200, 1],
    [100.0, 110.0, 2000, 2],
    [168.0, 90.0, 2300, 3],
    [200.0, 150.0, 1800, 4],
    [260.0, 130.0, 2100, 5],
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new NavigationBar(title: '麦田动画'),
      body: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.75,
              child: Stack(
                children: <Widget>[
                  Image.asset(
                    son
                        ? 'assets/images/bg_down.png'
                        : 'assets/images/bg_down_night.png',
                    fit: BoxFit.fill,
                    width: MediaQuery.of(context).size.width,
                    gaplessPlayback: true,
                  ),
                  Positioned(
                    width: MediaQuery.of(context).size.width,
                    bottom: 0,
                    child: Image.asset(
                        son
                            ? 'assets/images/bg_up_f.png'
                            : 'assets/images/bg_up_night.png',
                        gaplessPlayback: true),
                  ),
                  Positioned(
                    top: 80,
                    child: son
                    ? Container()
                    : Image.asset('assets/images/bg_moon.png', width: 70),
                  ),
                  Positioned(
                    right: 26,
                    top: MediaQuery.of(context).size.height * 0.75 * 0.6,
                    child: Image.asset(
                      son
                          ? 'assets/images/windmill.png'
                          : 'assets/images/windmill_night.png',
                      width: 25,
                      gaplessPlayback: true,
                    ),
                  ),

                  /// 风车
                  Positioned(
                    right: 13,
                    top: MediaQuery.of(context).size.height * 0.75 * 0.6 - 25,
                    child: RotationTransition(
                      turns: _controller,
                      alignment: Alignment.center,
                      child: Image.asset(
                        son
                            ? 'assets/images/fengshan.png'
                            : 'assets/images/fengshan_night.png',
                        width: 50,
                        gaplessPlayback: true,
                      ),
                    ),
                  ),

                  ///云
                  Stack(
                    children: dataOne.map((item) {
                      return Positioned(
                        top: item['top'],
                        child: CloudWidget(
                          milliseconds: item['milliseconds'],
                          img: item['img'],
                          width: item['width'],
                        ),
                      );
                    }).toList(),
                  ),

                  ///球
                  Stack(
                    children: dataTwo.map((item) {
                      return Positioned(
                          left: item[0],
                          bottom: item[1],
                          child: WheatWidget(
                            milliseconds: item[2],
                            day: item[3],
                          ));
                    }).toList(),
                  )
                ],
              ),
            ),
            RaisedButton(
              onPressed: () {
                setState(() {
                  son = !son;
                  print('获取控件的大小=>width:${context.size.width},height:${context.size.height}，$son');
                });
              },
              child: Text('切换'),
            ),
          ],
        ),
      ),
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _controller?.dispose();
    controller?.dispose();
    super.dispose();
  }
}