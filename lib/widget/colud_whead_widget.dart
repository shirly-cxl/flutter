import 'package:flutter/material.dart';

class CloudWidget extends StatefulWidget {
  final int milliseconds;
  final String img;
  final double width;

  const CloudWidget({
    Key key,
    this.milliseconds,
    this.img,
    this.width,
  }) : super(key: key);
  @override
  _CloudWidgetState createState() => _CloudWidgetState();
}

class _CloudWidgetState extends State<CloudWidget>
    with TickerProviderStateMixin {
  AnimationController controller;
  Animation<Offset> animation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(
        vsync: this, duration: new Duration(milliseconds: widget.milliseconds));
    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });
    controller.forward();
    animation = Tween(begin: Offset(0.0, 0.0), end: Offset(10.0, 0.0))
        .animate(controller);
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: animation,
      child: Image.asset(widget.img, width: widget.width),
    );
  }
  @override
   dispose() {
    // TODO: implement dispose
    controller?.dispose();
    super.dispose();
  }
}

class WheatWidget extends StatefulWidget {
  final int milliseconds;
  final int day;
  const WheatWidget({
    Key key,
    this.milliseconds,
    this.day,
  }) : super(key: key);
  @override
  _WheatWidgetState createState() => _WheatWidgetState();
}

class _WheatWidgetState extends State<WheatWidget>
    with TickerProviderStateMixin {
  AnimationController controller;
  Animation<Offset> animation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(
        vsync: this, duration: new Duration(milliseconds: widget.milliseconds));
    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });
    animation = Tween(
      begin: Offset(0, 0),
      end: Offset(0, 0.5),
    ).animate(controller);
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
        position: animation,
        child: Column(
          children: <Widget>[
            Image.asset(
              'assets/images/wheat_3.png',
              width: 60,
              gaplessPlayback: true,
            ),
            Text('第${widget.day}天', style: TextStyle(color: Colors.white)),
          ],
        ));
  }
  @override
   dispose() {
    // TODO: implement dispose
    controller?.dispose();
    super.dispose();
  }
}
