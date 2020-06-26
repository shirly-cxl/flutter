import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:total/util/tools.dart';

class HousePropertyPage extends StatefulWidget {
  @override
  _HousePropertyPageState createState() => _HousePropertyPageState();
}

class _HousePropertyPageState extends State<HousePropertyPage> {
  int radio = 1;
  var type,houseType;
  List typeList=['普通住宅','高档住宅','豪华别墅'];
  List houseTypeList=['一房一厅','两房一厅','三房一厅','三房两厅','三房以上'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new NavigationBar(
        title: '房产',
        mainColor: Colors.black,
        backgroundColor: Colors.white,
        rightDMActions: <Widget>[
          InkWell(
            onTap:(){
              print('房产');
            },
              child: Image.network(
                'https://img02.mockplus.cn/idoc/xd/2020-06-16/810ea625-c253-4c83-ad19-4ea64b98c13e.png',
                width: 24,height: 24,)),
          Space(),
        ],
        leading: Container(
          margin: EdgeInsets.only(left: 16),
          child: InkWell(
            onTap: ()=>pop(),
            child: UnconstrainedBox(
                child: Image.network('https://img02.mockplus.cn/idoc/xd/2020-06-16/2afdb9f6-425b-491a-af09-d5bfdf221abd.png',width: 24,height: 24,)),
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 16,right: 20),
            color: Colors.white,
            child: Row(
              children: <Widget>[
                Text("租房居住",
                  style: TextStyle(fontSize: 16,
                      color: Color(0xff262626)),),
                Spacer(),
                Radio(
                    value: 0,
                    groupValue: this.radio,
                    onChanged: (value) {
                      setState(() {
                        radio = value;
                      });
                    }),
              ],
            ),
          ),
          Space(),
          Container(
            padding: EdgeInsets.only(left: 16,right: 20),
            color: Colors.white,
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text("自有房产无贷款",
                      style: TextStyle(fontSize: 16,
                          color: Color(0xff262626)),),
                    Spacer(),
                    Radio(
                        value: 1,
                        groupValue: this.radio,
                        onChanged: (value) {
                          setState(() {
                            radio = value;
                          });
                        }),
                  ],
                ),
                Container(
                    color: Colors.white,
                    child: radio == 1
                        ? Column(
                      children: <Widget>[
                        Container(
                          height: 48,
                          padding: EdgeInsets.only(left:8,right: 4),
                          child: Row(
                            children: <Widget>[
                              Text(
                                '类型',
                                style: TextStyle(color: Color(0xff595959), fontSize: 14.0),
                              ),
                              Spacer(),
                              InkWell(
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                      type ==null ? '普通住宅' :'$type',
                                      style: TextStyle(color: Color(0xffBFBFBF), fontSize: 14.0),
                                    ),
                                    Space(width: 4,),
                                    Icon(Icons.arrow_forward_ios,color: Color(0xffBFBFBF),size: 18,)
                                  ],
                                ),
                                onTap: ()=>_bottomType(context,typeList,'类型').then((v){
                                  setState(() {
                                    type=v;
                                  });
                                }),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 48,
                          padding: EdgeInsets.only(left:8,right: 4),
                          child: Row(
                            children: <Widget>[
                              Text(
                                '户型',
                                style: TextStyle(color: Color(0xff595959), fontSize: 14.0),
                              ),
                              Spacer(),
                              InkWell(
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                    houseType==null ? '三房以上' :'$houseType',
                                      style: TextStyle(color: Color(0xffBFBFBF), fontSize: 14.0),
                                    ),
                                    Space(width: 4,),
                                    Icon(Icons.arrow_forward_ios,color: Color(0xffBFBFBF),size: 18,)
                                  ],
                                ),
                                onTap: ()=>_bottomType(context,houseTypeList,'户型').then((v){
                                  setState(() {
                                    houseType=v;
                                  });
                                }),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                        : Container()),
              ],
            ),
          ),
          Space(),
          Container(
            padding: EdgeInsets.only(left: 16,right: 20),
            color: Colors.white,
            child: Row(
              children: <Widget>[
                Text("自有房产有贷款",
                  style: TextStyle(fontSize: 16,
                      color: Color(0xff262626)),),
                Spacer(),
                Radio(
                    value: 2,
                    groupValue: this.radio,
                    onChanged: (value) {
                      setState(() {
                        radio = value;
                      });
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}



//底部类型选择器
_bottomType(context, List list,String title) {
  String selectorIndex = list[0];
  return showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
      ),
      builder: (context) {
        return Container(
          height: 284,
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 20,left: 15,right: 15),
                child: Row(
                  children: <Widget>[
                    InkWell(
                      child: Text("取消",
                        style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Color(0xff262626)
                      ),),
                      onTap:() => pop(),
                    ),
                    Spacer(),
                    Text("$title",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Color(0xff262626)
                      ),),
                    Spacer(),
                    InkWell(
                      child: Text("确定",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Color(0xff262626)
                        ),),
                      onTap: () =>pop(selectorIndex),
                    ),
                  ],
                ),
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
