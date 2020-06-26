import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:total/util/tools.dart';

class NestedScrollViewPage extends StatefulWidget {
  @override
  _NestedScrollViewPageState createState() => _NestedScrollViewPageState();
}

class _NestedScrollViewPageState extends State<NestedScrollViewPage> with SingleTickerProviderStateMixin{
  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this,length: listTabBar.length);
    timer();
  }
  timer(){
    int seconds = 0;
    Timer.periodic(Duration(seconds: 1), (timer) {
      showToastColor(context,'详细资料，需付费查看',backgroundColor: Color(0xff7EBFFC));
      if(seconds>6){
        timer.cancel();
        return;
      }
      seconds ++;
    });
  }

  List listFan=[
    { 'name':'粉丝','number':'4,698','onTap':(){print('粉丝');}},
    { 'name':'关注','number':'168','onTap':(){}},
    { 'name':'人气','number':'26,749','onTap':(){}},
  ];
  List _imgs = [
    'https://img02.mockplus.cn/idoc/xd/2020-06-22/13d78a93-95ae-4665-acdb-ae66f9347180.png',
    'https://img02.mockplus.cn/idoc/xd/2020-06-22/17e6873b-ac13-42b2-b17c-019b7a8dbfa9.png',
    'https://img02.mockplus.cn/idoc/xd/2020-06-22/ae966f3e-786a-4913-8155-d3f5f14e8d6e.png',
    'https://img02.mockplus.cn/idoc/xd/2020-06-22/6d2d30ff-e9fe-4d89-a2e3-32a027e78ebf.png',
    'https://img02.mockplus.cn/idoc/xd/2020-06-22/1f5cd342-dcf2-40fd-ab24-2c48693fb300.png',
  ];
  List listTabBar=[
    Icon(Icons.format_indent_decrease,),Icon(Icons.translate),Icon(Icons.perm_media), Icon(Icons.play_circle_outline)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:NestedScrollView(
        headerSliverBuilder: (context,b){
          return [
          SliverAppBar(
            expandedHeight: winHeight(context)*0.46,
            pinned: true,
            backgroundColor: Colors.white,
            elevation: 0,
            leading: Container(),
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: <Widget>[
                  Image.network('https://img02.mockplus.cn/idoc/xd/2020-06-22/25f526b9-5118-4881-a134-c596b105dd31.png',
                    fit: BoxFit.cover,),
                  Container(
                  margin: EdgeInsets.only(top:  winHeight(context)*0.08,left:  16,right: 16),
                   child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          InkWell(
                              child: Image.network(
                                'https://img02.mockplus.cn/idoc/xd/2020-06-22/377cb0ae-fcac-477c-963d-174368dfdf73.png',
                                width: 24,
                                height: 24,
                                fit: BoxFit.cover,),
                            onTap: ()=>pop(),
                          ),
                         Spacer(),
                          Column(
                           children: <Widget>[
                             Row(
                               children: <Widget>[
                                 Text('Winnie',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.white),),
                                 Space(),
                                Image.network('https://img02.mockplus.cn/idoc/xd/2020-06-22/595043da-7741-4715-9939-4a2c01676999.png',
                                  width: 9,height: 9, fit: BoxFit.cover,)
                               ],
                             ),
                             Text('网值ID:88888888',style: TextStyle(fontSize: 14,color: Colors.white),),
                           ],
                         ),
                          Spacer(),
                          Image.network('https://img02.mockplus.cn/idoc/xd/2020-06-22/e15e4c58-617c-41f6-9b03-54f2eac88b9e.png',
                            width: 24,height: 24,fit: BoxFit.cover,),
                        ],
                      ),
                      Space(height: 12,),
                      Container(
                        height: 85,
                        width: 85,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(85/2),
                          border: Border.all(
                            width: 2,
                            color: Colors.white
                          )
                        ),
                        child:ClipRRect(
                            borderRadius: BorderRadius.circular(85/2),
                            child: Image.network(
                              'https://img02.mockplus.cn/idoc/xd/2020-06-22/7d5b984d-4e68-4b5d-bc8e-4870d35bfbfd.png',
                              width: 85,
                              height: 85,
                              fit: BoxFit.cover,)),
                      ),
                    ],
                  ),
                ),
                  Positioned(
                    top: winHeight(context)/3.3,
                    left:winWidth(context)/4,
                    child: Row(
                      children:List.generate(listFan.length, (index){
                        return InkWell(
                          child: Container(
                            margin: EdgeInsets.only(right: winWidth(context)*0.1),
                            child: Column(
                              children: <Widget>[
                                Text('${listFan[index]['number']}',style: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.bold),),
                                Space(height: 5,),
                                Text('${listFan[index]['name']}',style: TextStyle(fontSize: 10,color: Colors.white),),
                              ],
                            ),
                          ),
                          onTap: listFan[index]['onTap'],
                        );
                      }),
                    ),
                  ),
                  Positioned(
                    left: 16,
                    top: winHeight(context)/2.5,
                    right: 16,
                    child: Container(
                      width: winWidth(context),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Image.network('https://img02.mockplus.cn/idoc/xd/2020-06-22/be13d38b-5634-4ba4-a650-05a85e8027d3.png',
                                width: 16,height: 16, fit: BoxFit.cover,),
                              Space(width: 8,),
                              Text('广东珠海',style: TextStyle(fontSize: 10,color: Color(0xff595959)),),
                              Spacer(),
                              Row(
                                children: _imgs.map((e){
                                  return Container(
                                    padding: EdgeInsets.only(right:e==_imgs.last ? 0 :16),
                                    child: Image.network('$e',width: 16,height: 16, fit: BoxFit.cover,),
                                  );
                                }).toList(),
                              )
                            ],
                          ),
                          Space(),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Image.network('https://img02.mockplus.cn/idoc/xd/2020-06-22/7fa110e8-5c9b-45c4-97a0-3feabd589084.png',height: 16,width: 14, fit: BoxFit.cover,),
                              Space(),
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    Text('暖雨晴风初破冻，柳眼眉腮，已觉春心动。酒意诗情谁与共？泪融残粉花钿重。乍试夹衫金缕缝，山枕斜欹，枕损钗头凤。独抱浓愁无好…',
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Color(0xff595959),
                                    ),),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
            SliverPersistentHeader(
              pinned: true,
              delegate: HeaderWidget(
                child: Container(
                  height: 49,
                  color: Colors.white,
                  alignment: Alignment.center,
                  child: TabBar(
                    controller: _tabController,
                    indicatorColor: Colors.white,
                    labelColor: Colors.pink,
                    tabs: listTabBar.map((e){
                      return Tab(icon: e,);
                    }).toList(),
                  ),
                ),
              ),
            )
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: <Widget>[
            Center(
                child: Text("基本资料")
            ),
            Container(
              padding: EdgeInsets.only(left: 16,right: 16),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: Text("实名")),
                    Expanded(
                        child: TextField(
                          textAlign: TextAlign.right,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                        ),
                    ),
                    Icon(Icons.arrow_forward_ios,size: 16,color: Colors.grey,),
                  ],
                )
            ),
            ListView(
              padding: EdgeInsets.only(left: 16,right: 5),
              children: <Widget>[
                Text("相册 6"),
                Wrap(
                  runSpacing: 9,
                  spacing: 9,
                  children: List.generate(10, (index){
                    return Image.network('https://img02.mockplus.cn/idoc/xd/2020-06-22/f7df0a67-eb0c-4247-80b2-65e1ab2ab87c.png',
                      width: (winWidth(context)-18-21)/2,
                      height:(winWidth(context)-18-21)/2,
                      fit: BoxFit.cover,);
                  }),
                ),
              ],
            ),
            Center(
                child: Text("视频")
            ),
          ],
        ),
      ),
    );
  }
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}

class HeaderWidget extends SliverPersistentHeaderDelegate{
  Widget child;
  HeaderWidget({this.child});
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
   return child;
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => 49.0;

  @override
  // TODO: implement minExtent
  double get minExtent => 49.0;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
  return true;
  }

}