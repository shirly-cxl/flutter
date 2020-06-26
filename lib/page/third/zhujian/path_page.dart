import 'package:flutter/material.dart';
import 'package:total/util/tools.dart';

class PathPage extends StatefulWidget {
  @override
  _PathPageState createState() => _PathPageState();
}

class _PathPageState extends State<PathPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new NavigationBar(title: '切割聊天气泡'),
      body: Center(
        child: DemoWidget(
          '切割聊天气泡测试',
          align: Align.right,
        ),
      ),
    );
  }
}

const _ArrowWidth=7.0;//箭头宽度
const _ArrowHeight=10.0;//箭头高度
const _MinHeight=40.0;//内容最小高度
const _MinWidth=32.0;//内容最小宽度


class DemoWidget extends StatelessWidget {
  final String msg;
  final Align align;
 DemoWidget(this.msg,{this.align = Align.left});
  
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper:TextPath(align) ,
      child: Container(
        color: Colors.green,
        padding: EdgeInsets.only(
          left:align == Align.left ? _ArrowWidth:0,
          right:align == Align.right ? _ArrowWidth:0,
        )
            .add(EdgeInsets.fromLTRB(7.0, 5.0, 7.0, 5.0)),
        child: Text(
          '$msg',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

enum Align{left,right}

class TextPath extends CustomClipper<Path>{
  final Align align;
  TextPath(this.align);

  @override
  Path getClip(Size size) {
    Path path1= new Path();
    Path path2= new Path();
    //中心点
    final centerPoint=(size.height/2).clamp(_MinHeight/2, _MinHeight/2);
    if(align==Align.left){
      //左边三角形
      path1.moveTo(0, centerPoint);
      path1.lineTo(_ArrowWidth, centerPoint-_ArrowHeight/2);
      path1.lineTo(_ArrowWidth, centerPoint+_ArrowHeight/2);
    }else{
      //右边三角形
      path1.moveTo(size.width, centerPoint);
      path1.lineTo(size.width-_ArrowWidth, centerPoint-_ArrowHeight/2);
      path1.lineTo(size.width-_ArrowWidth, centerPoint+_ArrowHeight/2);
    }
    path1.close();
    //内容矩形
    Rect rect=Rect.fromLTWH(align==Align.left ?_ArrowWidth :0, 0, (size.width-_ArrowWidth), size.height);
    path2.addRRect(RRect.fromRectAndRadius(rect, Radius.circular(5)));
    //合并
    //Offset(0,0)=Offset.zero
    path1.addPath(path2, Offset.zero);
    return path1;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}