import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:total/util/tools.dart';

class PainterPage extends StatefulWidget {
  @override
  _PainterPageState createState() => _PainterPageState();
}

class _PainterPageState extends State<PainterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new NavigationBar(title: '画笔'),
      body: Center(
        child: new CustomPaint(
        painter: PainterWidget(),
    ),
      ),
    );
  }
}

class PainterWidget extends CustomPainter{
  Paint _bigCirularPaint=new Paint()
  ..color=Colors.teal
  ..style=PaintingStyle.stroke
  ..strokeWidth=4;

  Paint _linePaint=new Paint()
    ..color=Colors.teal
    ..style=PaintingStyle.fill
    ..strokeWidth=4;

  Offset _center = Offset(0,0);
  double _radius =math.min(450/3, 450/3);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(_center, _radius, _bigCirularPaint);
    _bigCirularPaint.style=PaintingStyle.fill;
    canvas.drawCircle(_center, _radius/20, _bigCirularPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

}