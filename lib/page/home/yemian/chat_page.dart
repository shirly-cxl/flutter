import 'package:flutter/material.dart';
import 'package:total/util/tools.dart';

//聊天
class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  TextEditingController textC = new TextEditingController();
  List<String> data = ['测试内容啊', 'ok'];
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
              itemCount: data.length,
              itemBuilder: (context, index) {
                return new MsgView(
                  index.isEven,
                  '${data[index]}',
                  align: index.isEven ?Align.right :Align.left,
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
//                        setState(() => data.insert(data.length, str));
                        setState(() => data.insert(0, str));
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
}

class MsgView extends StatelessWidget {
  final bool isSelf;
  final String content;
  final Align align;
  MsgView(
      this.isSelf,
      this.content,
      {this.align = Align.left}
      );

  @override
  Widget build(BuildContext context) {
    List<Widget> body = [
      new Padding(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: new CircleAvatar(
          radius: 25,
          child: new Text('${content.substring(0, 1)}'),
        ),
      ),
      ClipPath(
        clipper:MsgPath(align) ,
        child: new Container(
          color: Colors.green,
//          decoration: BoxDecoration(
//            color: Colors.green,
//            borderRadius: BorderRadius.all(Radius.circular(5)),
//          ),
          width: content.length >= 30 ? MediaQuery.of(context).size.width*(1-0.4) : null,
          padding: EdgeInsets.only(
            left:align == Align.left ? _ArrowWidth:0,
            right:align == Align.right ? _ArrowWidth:0,
          )
              .add(EdgeInsets.fromLTRB(7.0, 5.0, 7.0, 5.0)),
          child: new Text(
            '$content',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      new Spacer(),
    ];
    if (isSelf) {
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

const _ArrowWidth=7.0;//箭头宽度
const _ArrowHeight=10.0;//箭头高度

enum Align{left,right}

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