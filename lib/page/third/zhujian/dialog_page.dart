import 'dart:math';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:total/util/tools.dart';
import 'package:total/widget/dialog/dialog_widget.dart';
import 'package:total/widget_common/button/two_button.dart';
import 'file:///D:/Projects/total/lib/widget/dialog/loading_dialog.dart';

//随机颜色
Color ramColor() {
  return Color.fromARGB(
      255, Random().nextInt(256), Random().nextInt(256), Random().nextInt(256));
}

class DialogPage extends StatefulWidget {
  @override
  _DialogPageState createState() => _DialogPageState();
}

class _DialogPageState extends State<DialogPage> {
  var pop;
  TextEditingController _controller = TextEditingController();

  void _selectAction() async {
    int index1 = await showPayActionSheets(context: context, title: '支付方式');
    print(index1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new NavigationBar(title: '弹窗/按钮'),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        children: <Widget>[
          FlatButton(
            child: Text('中间弹框',style: TextStyle(color: Colors.white,fontSize: 16),),
            color: Colors.deepPurpleAccent,
            onPressed: ()=>futureDialog(context, '中间弹框').then((value) {
              setState(() {
                pop=value;
                print(pop);
              });
            }),
          ),
          FlatButton(
            child: Text('底部弹框',style: TextStyle(color: Colors.white,fontSize: 16),),
            color: Colors.deepPurpleAccent,
            onPressed: ()=>_bottomSheetDiLike(context,_controller),
          ),
          FlatButton(
            child: Text('自定义弹框',style: TextStyle(color: Colors.white,fontSize: 16),),
            color: Colors.deepPurpleAccent,
            onPressed: (){
              showDialog(
                  context: context,
                  builder: (context){
                    return LoadingDialog();
                  });
            },
          ),
          FlatButton(
            child: Text('自定义ios底部弹框',style: TextStyle(color: Colors.white,fontSize: 16),),
            color: Colors.deepPurpleAccent,
            onPressed: ()=>_selectAction(),
          ),
          RaisedButton(
            child: Text('ios中间弹框',style: TextStyle(color: Colors.white,fontSize: 16),),
            color: Colors.deepPurpleAccent,
            onPressed: ()=>iosDialog(context),
          ),
          OutlineButton(
            child: Text('OutlineButton',style: TextStyle(color: Colors.black,fontSize: 16),),
            onPressed: (){},
          ),
          IconButton(
            icon: Icon(Icons.settings),
            iconSize: 30,
            color: Colors.black,
            onPressed: (){},
          ),
          CupertinoButton(
            child: Text('CupertinoButton',style: TextStyle(color: Colors.white,fontSize: 16),),
            color: Colors.deepPurpleAccent,
            onPressed: (){},
          )
        ],
      ),
    );
  }
}

//返回bool值的确认弹窗
Future<bool> futureDialog(context, String titleText) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          titlePadding: EdgeInsets.all(30),
          contentPadding: EdgeInsets.all(0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          title: Container(
            alignment: Alignment.center,
            child: Text(
              '$titleText',
              style: TextStyle(fontSize: 15),
            ),
          ),
          content: Row(
            children: <Widget>[
              Expanded(
                  child: InkWell(
                    onTap: () {
                      pop(true);
                    },
                    child: Container(
                      color:ramColor() ,
                      height: 50,
                      alignment: Alignment.center,
                      child: Text("是"),
                    ),
                  )),
              Expanded(
                  child: InkWell(
                    onTap: () {
                      pop(false);
                    },
                    child: Container(
                      height: 50,
                      alignment: Alignment.center,
                      child: Text("否"),
                    ),
                  ))
            ],
          ),
        );
      });
}


//讨厌
_bottomSheetDiLike(context,TextEditingController _controller) {
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
      ),
      builder: (BuildContext context) {
        return Container(
          margin: EdgeInsets.only(bottom: winKeyHeight(context)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                margin:
                EdgeInsets.only(top: 15, bottom: 13),
                child: Text(
                  '提交讨厌理由',
                  style: TextStyle(
                    color: Color(0xffBFBFBF),
                    fontSize: 14,
                  ),
                ),
              ),
              Container(
                margin:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                decoration: BoxDecoration(
                  color: Color(0xffE9E9E9),
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                child: new TextField(
                  controller: _controller,
                  maxLength: 120,
                  maxLines: 3,
                  decoration: const InputDecoration(
                    hintText: '请输入正文',
                    helperStyle: TextStyle(
                      fontSize: 14,
                      color: Color(0xffBFBFBF),
                    ),
                    hintStyle: TextStyle(
                      fontSize: 14,
                      color: Color(0xff8C8C8C),
                    ),
                    contentPadding: const EdgeInsets.only(left: 8,top: 8),
                    border: InputBorder.none,
                  ),
                  onChanged: (val) {
                    print(val);
                  },
                ),
              ),
              Container(
                height: 8,
                color: Color(0xff8C8C8C).withOpacity(0.4),
                margin: EdgeInsets.symmetric(vertical: 10),
              ),
              TwoButton(
                buttonText1: '取消',
                buttonText2: '提交',
                onPressed1: () =>pop(),
                onPressed2: () {
                  pop();
                  print('提交');
                },
              ),
            ],
          ),
        );
      });
}


iosDialog(context){
  showDialog(
      context: context,
      builder: (context){
        return CupertinoAlertDialog(
          content: Container(
            child: Text('CupertinoAlertDialog'),
          ),
          actions: <Widget>[
            CupertinoDialogAction(
              child: Text(
                "取消",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              onPressed: () => pop(),
            ),
            CupertinoDialogAction(
              child: Text(
                "确认",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              onPressed: () => pop(),
            ),
          ],
        );
      }
  );
}

//底部选择器
bottomSelector(context, List list) {
  String selectorIndex = list[0];
  return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: 300,
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  InkWell(
                    child: Text("取消"),
                    onTap: () {
                      pop();
                    },
                  ),
                  Spacer(),
                  InkWell(
                    child: Text("确定"),
                    onTap: () {
                      pop(selectorIndex);
                    },
                  ),
                ],
              ),
              Expanded(
                child: CupertinoPicker(
                    itemExtent: 50,  //
                    onSelectedItemChanged: (index) {
                      selectorIndex = list[index];
                      print(selectorIndex);
                    },
                    children: list.map((item) {
                      return Container(
                        alignment: Alignment.center,
                        child: Text(item),
                      );
                    }).toList()),
              )
            ],
          ),
        );
      });
}

