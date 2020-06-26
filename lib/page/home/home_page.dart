import 'package:total/page/home/yemian/chat_page.dart';
import 'package:total/util/tools.dart';
import 'package:flutter/material.dart';
import 'yemian/chat_result_page.dart';
import 'yemian/children_page.dart';
import 'yemian/day_night_page.dart';
import 'yemian/face_and_face_page.dart';
import 'yemian/go_page.dart';
import 'yemian/hobby_page.dart';
import 'yemian/house_property_page.dart';
import 'yemian/password_page.dart';
import 'yemian/time_page.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List data=[
    {'text':'聊天','onPressed':()=>routePush(ChatPage()),},
    {'text':'支付密码','onPressed':()=>routePush(PassWordPage()),},
    {'text':'聊天（完善）','onPressed':()=>routePush(ChatResultPage()),},
    {'text':'麦田动画','onPressed':()=>routePush(DayNightPage()),},
    {'text':'时钟','onPressed':()=>routePush(TimePage()),},
    {'text':'面对面建群','onPressed':()=>routePush(FaceAndFacePage()),},
    {'text':'儿童','onPressed':()=>routePush(ChildrenPage()),},
    {'text':'房产','onPressed':()=>routePush(HousePropertyPage()),},
    {'text':'想去','onPressed':()=>routePush(GoPage()),},
    {'text':'兴趣爱好','onPressed':()=>routePush(HobbyPage()),},
//    {'text':'儿童','onPressed':()=>routePush(ChildrenPage()),},
//    {'text':'麦田动画','onPressed':()=>routePush(DayNightPage()),},
//    {'text':'时钟','onPressed':()=>routePush(TimePage()),},
//    {'text':'面对面建群','onPressed':()=>routePush(FaceAndFacePage()),},
//    {'text':'儿童','onPressed':()=>routePush(ChildrenPage()),},
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new NavigationBar(title: '各种页面'),
      body: new GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //横轴元素个数
              crossAxisCount: 2,
              //纵轴间距
              mainAxisSpacing: 5.0,
              //横轴间距
              crossAxisSpacing: 5.0,
              //子组件宽高长度比例
              childAspectRatio: 2.0,
          ),
          itemBuilder:(BuildContext context, int index){
            VoidCallback _onPressed=data[index]['onPressed'];
            var _text=data[index]['text'];
            return Container(
              margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
              child: FlatButton(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  '$_text',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16),
                ),
                onPressed: _onPressed,
                color: Colors.green,
              ),
            );
          },
        itemCount: data.length,
      ),
    );
  }
}
