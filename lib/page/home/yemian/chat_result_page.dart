import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:total/util/tools.dart';
import 'dart:math';

///无返回值
typedef OnCallBack ();
///有返回值String/Widget
typedef OnCallBackTwo =String Function(dynamic data,String id);
//聊天
class ChatResultPage extends StatefulWidget {
  @override
  _ChatResultPageState createState() => _ChatResultPageState();
}

class _ChatResultPageState extends State<ChatResultPage> {
  TextEditingController textC = new TextEditingController();
  List _chatList = [
    {
      "text": "ojbk",
      "isowner": 2,
    },
    {
      "text": "测试内容~",
      "isowner": 2,
    },
    {
      "text": "ok",
      "isowner": 2,
    },
    {
      "text": "测试内容啊",
      "isowner": 1
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new NavigationBar(
        title: '聊天',
        rightDMActions: <Widget>[
          Icon(
            Icons.more_horiz,
            color: Colors.white,
          ),
          SizedBox(width: 10)
        ],
      ),
      body: new Column(
        children: <Widget>[
          new Expanded(
            child: new ListView.builder(
              reverse: true,
              itemCount: _chatList.length,
              itemBuilder: (context, index) {
                return new MsgView(
                  content: _chatList[index]["text"],
                  isOwner: _chatList[index]["isowner"],
                  chatList: _chatList,
                );
              },
            ),),
          new Container(
            height: 50,
            child: new Row(
              children: <Widget>[
                Space(width: 5,),
                new Icon(Icons.settings_voice),
                Space(width: 5,),
                new Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius:BorderRadius.all(Radius.circular(25)),
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    padding: EdgeInsets.only(left: 10),
                    height: 30,
                    child: new TextField(
                      controller: textC,
//                        用于控制键盘动作（一般位于右下角，默认是完成）
//                      textInputAction: TextInputAction.send,
                      onSubmitted: (String str){
                        if(textC.text.isEmpty){
                          Scaffold.of(context).showSnackBar(SnackBar(
                            content: Text("请输入内容"),
                            action: SnackBarAction(
                              label: "好的",
                              onPressed: () => null,
                            ),
                          ));
                          return;
                        }
                        textC.clear();
                        setState(() =>_chatList.insert(0, {"text": str, "isowner": 1}));
                      },
//                      maxLines: null,
//                      expands: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                new Icon(Icons.sentiment_satisfied),
                Space(),
                new Icon(Icons.add_circle_outline,),
                Space(),
              ],
            ),
          ),
        ],
      ),
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    textC.dispose();
  }
}

class MsgView extends StatelessWidget {
  final String content;
  final List chatList;
  final int isOwner;
  MsgView({ this.chatList, this.content, this.isOwner,});

  @override
  Widget build(BuildContext context) {
    List<Widget> body = isOwner == 3
    ?[
      Container(
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        child: Text(content),
      ),
    ]
    :[
      new Padding(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: ShakeView(
          isOwner: isOwner,
          chatList: chatList,
        ),
      ),
      MsgClipPath(
        content,
        align: isOwner == 1
            ?Align.right
            : Align.left,
      ),
      new Spacer(),
    ];
    // body = body.reversed.toList();
    //加判断可以区分方向
    if (isOwner == 1) {
      body = body.reversed.toList();
    }
    return new Container(
      margin: EdgeInsets.only(top: 8),
      width: MediaQuery.of(context).size.width,
      child: new Row(
        mainAxisSize: MainAxisSize.min,
        children: body,
      ),
    );
  }
}

///气泡颜色
class  MsgClipPath extends StatelessWidget {
  final Align align;
  final String text;
  MsgClipPath(this.text, {this.align=Align.right});
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper:MsgPath(align),
      child: Container(
        padding: EdgeInsets.only(left: align==Align.left?_ArrowWidth:0,right: align==Align.left?0:_ArrowWidth).add(EdgeInsets.all(10)),
        color:  align!=Align.left?Colors.green[300]:Colors.white,
        child: Text(text,style: TextStyle(color:align!=Align.left?Colors.white:Colors.black,fontSize:15),),
      ),
    );
  }
}

const _ArrowWidth=7.0;//箭头宽度
const _ArrowHeight=10.0;//箭头高度
enum Align{left,right}

///封装裁剪气泡
class MsgPath extends CustomClipper<Path>{
  final Align align;
  MsgPath(this.align);

  @override
  Path getClip(Size size) {
    Path path1= new Path();
    Path path2= new Path();
    //中心点
    final centerPoint=(size.height/2);
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



/// 封装之后的拍一拍
class ShakeView extends StatefulWidget {
  final int isOwner;
  final List chatList;
  ShakeView({
    this.isOwner,
    this.chatList,
  });

  _ShakeViewState createState() => _ShakeViewState();
}

class _ShakeViewState extends State<ShakeView>
    with TickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  initState() {
    super.initState();
    initStart();
  }
  initStart([bool isInit=true]){
    controller = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    animation = TweenSequence<double>([
      //使用TweenSequence进行多组补间动画
      TweenSequenceItem<double>(tween: Tween(begin: 0, end: 10), weight: 1),
      TweenSequenceItem<double>(tween: Tween(begin: 10, end: 0), weight: 1),
      TweenSequenceItem<double>(tween: Tween(begin: 0, end: -10), weight: 1),
      TweenSequenceItem<double>(tween: Tween(begin: -10, end: 0), weight: 1),
    ]).animate(controller);
   if(!isInit) controller.forward();
  }

  Widget build(BuildContext context) {
    return AnimateWidget(
      animation: animation,
      isOwner: widget.isOwner,
      onCallBack: (){
        setState(() {
          if (widget.isOwner == 1) {
            widget.chatList.insert(0,{"text": "你拍了拍自己", "isowner": 3});
          } else {
            widget.chatList.insert(0,{"text": "你拍了拍任嘉伦", "isowner": 3});
          }
          initStart(false);
        });

      },
    );
  }

  dispose() {
    controller.dispose();
    super.dispose();
  }
}

class AnimateWidget extends AnimatedWidget {
  final OnCallBack onCallBack;
  final int isOwner;
  AnimateWidget({Animation<double> animation,this.isOwner,this.onCallBack})
      : super(listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    var result = Transform(
      transform: Matrix4.rotationZ(animation.value * pi / 180),
      alignment: Alignment.bottomCenter,
      child:  ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Image.network(
         isOwner == 1
              ? "https://img02.mockplus.cn/idoc/xd/2020-06-03/40bf1277-9f6b-4a49-8cb5-4635d2f50dd3.png"
              : "https://img02.mockplus.cn/idoc/xd/2020-06-03/281a47e6-d8fb-4bb5-8f53-fc798b9173ed.png",
          height: 40,
          width: 40,
          fit: BoxFit.cover,
        ),
      ),
    );
    return InkWell(
      child: result,
      onDoubleTap: (){
        onCallBack();
      },
    );
  }
}