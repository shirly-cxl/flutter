import 'package:flutter/material.dart';
import 'package:flutter_verification_code_input/flutter_verification_code_input.dart';
import 'package:total/util/tools.dart';

class FaceAndFacePage extends StatefulWidget {
  @override
  _FaceAndFacePageState createState() => _FaceAndFacePageState();
}

class _FaceAndFacePageState extends State<FaceAndFacePage> {
  //TextEditingController controllers = TextEditingController();
  //FocusNode numNode = FocusNode();
//  bool offstage = true;
//  String num;
//  List<Task> tasks = [];
//  List intList = [0, 1, 2, 3];
  String _onCompleted = "";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0,
          centerTitle: true,
          leading: FlatButton(
              onPressed: ()=>pop(),
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              )),
          title: Text(
            '面对面建群',
            style: TextStyle(
              fontSize: 24,
            ),
          ),
        ),
        body: ListView(
          children: <Widget>[
            Container(
              height: 50,
            ),
            (_onCompleted != "")
                ? Container()
                : Column(
              children: <Widget>[
                Text(
                  '和身边的朋友输入同样的四个数',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white.withOpacity(0.6),
                  ),
                ),
                Text(
                  '字，进入同一个群聊',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white.withOpacity(0.6),
                  ),
                ),
              ],
            ),
            Container(
              alignment: Alignment.center,
              child: VerificationCodeInput(
                keyboardType: TextInputType.number,
                length: 4,
                //autofocus: false,
                textStyle: TextStyle(fontSize: 30.0, color: Colors.white),
                itemDecoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.white,
                    ),
                  ),
                ),
                onCompleted: (String value) {
                  setState(() {
                    _onCompleted = value;
                    print(value);
                  });
                },
              ),
            ),
            (_onCompleted != "")
                ? Container(
              margin: EdgeInsets.only(right: 17, left: 17, top: 15),
              child: Column(
                children: <Widget>[
                  Text(
                    '这些朋友也将进入群聊',
                    style: TextStyle(
                      fontSize: 21,
                      color: Colors.white.withOpacity(0.6),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: 20,
                      bottom: 26,
                    ),
                    height: 1,
                    color: Colors.white.withOpacity(0.6),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      children: <Widget>[
                        CircleAvatar(
                          radius: 26,
                          backgroundImage: NetworkImage(
                            'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1583129815868&di=8a5f61dae9dfa0e739ec72f0f2cf215a&imgtype=0&src=http%3A%2F%2Fpic2.zhimg.com%2F50%2Fv2-8f42a3972157194a1451e60957dc57e5_hd.jpg',
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            top: 7,
                          ),
                          child: Text(
                            'jacksun',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white.withOpacity(0.7),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      margin: EdgeInsets.only(
                        top: 150,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        '进入该群',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    onTap: () {
                      print('111');
                    },
                  )
                ],
              ),
            )
                : Container(),
//            Center(
//              child: Wrap(
//                spacing: 15,
//                children: List.generate(intList.length, (index) {
//                  double _paddingWidth =
//                      MediaQuery.of(context).size.width - (10.0 * 2);
//                  double _width = (_paddingWidth - 30) / 8;
//                  return Container(
//                    width: _width,
//                    decoration: BoxDecoration(
//                      border: Border(
//                        bottom: BorderSide(
//                          color: Colors.white,
//                        ),
//                      ),
//                    ),
//                    child: new TextField(
//                      //controller: controllers,
//                      keyboardType: TextInputType.number,
//                      cursorColor: Colors.white,
//                      style: TextStyle(
//                        color: Colors.white,
//                        fontSize: 28,
//                      ),
//                      onChanged: (nums) {
//                        num = nums;
//                        print(num);
//                      },
//                      onTap: () {
//                        setState(() {
//                          if (index == 3) {
//                            offstage = !offstage;
//                          }
//                        });
//                      },
//                      decoration: InputDecoration(
//                        contentPadding:
//                            EdgeInsets.only(left: 10, top: 0, bottom: 0),
//                        border: OutlineInputBorder(
//                          borderSide: BorderSide.none,
//                        ),
//                      ),
//                    ),
//                  );
//                }),
//              ),
//            ),
//            Offstage(
//              offstage: offstage,
//              child: Container(
//                margin: EdgeInsets.only(right: 17, left: 17, top: 15),
//                child: Column(
//                  children: <Widget>[
//                    Text(
//                      '这些朋友也将进入群聊',
//                      style: TextStyle(
//                        fontSize: 21,
//                        color: Colors.white.withOpacity(0.6),
//                      ),
//                    ),
//                    Container(
//                      margin: EdgeInsets.only(
//                        top: 20,
//                        bottom: 26,
//                      ),
//                      height: 1,
//                      color: Colors.white.withOpacity(0.6),
//                    ),
//                    Align(
//                      alignment: Alignment.centerLeft,
//                      child: Column(
//                        children: <Widget>[
//                          CircleAvatar(
//                            radius: 26,
//                            backgroundImage: NetworkImage(
//                              'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1583129815868&di=8a5f61dae9dfa0e739ec72f0f2cf215a&imgtype=0&src=http%3A%2F%2Fpic2.zhimg.com%2F50%2Fv2-8f42a3972157194a1451e60957dc57e5_hd.jpg',
//                            ),
//                          ),
//                          Container(
//                            margin: EdgeInsets.only(
//                              top: 7,
//                            ),
//                            child: Text(
//                              'jacksun',
//                              style: TextStyle(
//                                fontSize: 18,
//                                color: Colors.white.withOpacity(0.7),
//                              ),
//                            ),
//                          ),
//                        ],
//                      ),
//                    ),
//                    GestureDetector(
//                      child: Container(
//                        width: double.infinity,
//                        decoration: BoxDecoration(
//                          color: Colors.blue,
//                          borderRadius: BorderRadius.circular(5.0),
//                        ),
//                        padding: EdgeInsets.only(top: 10, bottom: 10),
//                        margin: EdgeInsets.only(
//                          top: 150,
//                        ),
//                        alignment: Alignment.center,
//                        child: Text(
//                          '进入该群',
//                          style: TextStyle(
//                            fontSize: 20,
//                            color: Colors.white,
//                          ),
//                        ),
//                      ),
//                      onTap: () {
//                        print('111');
//                      },
//                    )
//                  ],
//                ),
//              ),
//            ),
          ],
        ),
      ),
    );
  }
}

class Task {
  final String comment;
  Task({this.comment});
}
