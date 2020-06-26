import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:total/util/tools.dart';


class TimePage extends StatefulWidget {
  @override
  _TimePageState createState() => _TimePageState();
}

class _TimePageState extends State<TimePage> {
  Timer _timer;
  @override
  void initState() {
    super.initState();
    _timer= Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new NavigationBar(title: '时钟'),
      body: new Center(
        child: new CustomPaint(
          painter: TestPainter(),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _timer.cancel();
    super.dispose();
  }

}

class TestPainter extends CustomPainter {
  static Color mainColor = Colors.teal;
  Paint _bigCirlarPaint = new Paint()
    ..color = mainColor
    ..style = PaintingStyle.stroke
    ..strokeWidth = 4;

  Paint _linePaint = new Paint()
    ..color = mainColor
    ..style = PaintingStyle.fill
    ..isAntiAlias = true
    ..strokeWidth = 4;

  Offset _center = Offset(0, 0);

  double _radius = math.min(450 / 3, 450 / 3);

  TextPainter textPainter = new TextPainter(
      textAlign: TextAlign.left, textDirection: TextDirection.ltr);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(_center, _radius, _bigCirlarPaint);
    _bigCirlarPaint.style = PaintingStyle.fill;
    canvas.drawCircle(_center, _radius / 20, _bigCirlarPaint);
    for (int i = 0; i < 60; i++) {
      // % 取余
      _linePaint.strokeWidth = i % 5 == 0 ? (i % 3 == 0 ? 10 : 4) : 1;
      canvas.drawLine(Offset(0, _radius - 10), Offset(0, _radius), _linePaint);
      canvas.rotate(math.pi / 30);
    }
    for (int i = 0; i < 12; i++) {
      canvas.save();
      canvas.translate(0.0, -_radius + 30);
      textPainter.text = TextSpan(
        style: TextStyle(color: mainColor, fontSize: 21),
        text: '${i == 0 ? '12' : i}',
      );
      canvas.rotate(-deg2Rad(30) * i);
      textPainter.layout();
      textPainter.paint(
          canvas, Offset(-textPainter.width / 2, -textPainter.height / 2));
      canvas.restore();
      canvas.rotate(deg2Rad(30));
    }
    int hours = DateTime.now().hour; //小时
    int minutes = DateTime.now().minute; //分钟
    int seconds = DateTime.now().second; //秒
    //小时针
    double hoursAngle = (minutes / 60 + hours - 12) * math.pi / 6;
    _linePaint.strokeWidth = 4;
    canvas.rotate(hoursAngle);
    canvas.drawLine(Offset.zero, Offset(0, -_radius + 80), _linePaint);
    //分钟针
    double minutesAngle = (minutes + seconds / 60) * math.pi / 30;
    _linePaint.strokeWidth = 2;
    canvas.rotate(-hoursAngle);
    canvas.rotate(minutesAngle);
    canvas.drawLine(Offset.zero, Offset(0, -_radius + 60), _linePaint);
    //秒针
    double secondsAngle = seconds * math.pi / 30;
    _linePaint.strokeWidth = 1;
    canvas.rotate(-minutesAngle);
    canvas.rotate(secondsAngle);
    canvas.drawLine(Offset.zero, Offset(0, -_radius + 30), _linePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

  num deg2Rad(num v) {
    return v * (math.pi / 180);
  }
}
