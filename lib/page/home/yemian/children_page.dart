import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:total/util/tools.dart';

class ChildrenPage extends StatefulWidget {
  @override
  _ChildrenPageState createState() => _ChildrenPageState();
}

class _ChildrenPageState extends State<ChildrenPage> {
  int radio = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new NavigationBar(
        title: '儿童',
        mainColor: Colors.black,
        backgroundColor: Colors.white,
        leading: Container(
          margin: EdgeInsets.only(left: 16),
          child: InkWell(
            onTap: ()=>pop(),
            child: UnconstrainedBox(
                child: Image.network('https://img02.mockplus.cn/idoc/xd/2020-06-16/2afdb9f6-425b-491a-af09-d5bfdf221abd.png',width: 24,height: 24,)),
          ),
        ),
      ),
      bottomSheet: InkWell(
        child: Container(
          color: Colors.white,
          height: 48,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            Image.network('https://img02.mockplus.cn/idoc/xd/2020-06-16/2c8828f2-a34a-4902-9a1b-312094c27e5a.png',width: 16,height: 16,),
            Space(width: 4,),
            Text("添加儿童",
              style: TextStyle(fontSize: 16,
                  color: Color(0xff1890FF),
              ),),
          ],),
        ),
        onTap: (){
          print('添加儿童');
        },
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 16,right: 20),
            color: Colors.white,
            child: Row(
              children: <Widget>[
                Text("无",
                  style: TextStyle(fontSize: 16,
                  color: Color(0xff595959)),),
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
            child: Row(
              children: <Widget>[
                Text("有",
                  style: TextStyle(fontSize: 16,
                      color: Color(0xff595959)),),
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
          ),
          radio == 1
         ? Column(
            children: <Widget>[
              LabelTile(title: '儿童1',),
              Space(),
              LabelTile(title: '儿童2',),
            ],
          )
          :Container(),
        ],
      ),
    );
  }
}



class LabelTile extends StatefulWidget {
  final String title;
  LabelTile({this.title,});

  @override
  _LabelTileState createState() => _LabelTileState();
}

class _LabelTileState extends State<LabelTile> {
  var gender = 0;
  var age;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(left: 16,right: 20),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Text("${widget.title}",
                style: TextStyle(fontSize: 16,
                    color: Color(0xff1890FF)),),
              Spacer(),
              IconButton(
                icon: Icon(Icons.cancel),
                color: Color(0xffBFBFBF),
                onPressed: (){},),
            ],
          ),
          Container(
            height: 48,
            padding: EdgeInsets.only(left:8),
            child: Row(
              children: <Widget>[
                Text(
                  '性别',
                  style: TextStyle(color: Color(0xff4D4D4D), fontSize: 14.0),
                ),
                Spacer(),
                InkWell(
                  child: Row(
                    children: <Widget>[
                      Text(
                        gender == 0 ? '男': '女',
                        style: TextStyle(color: Color(0xffBFBFBF), fontSize: 14.0),
                      ),
                      Space(width: 4,),
                      Icon(Icons.arrow_forward_ios,color: Color(0xffBFBFBF),size: 18,)
                    ],
                  ),
                  onTap: ()=>_bottomSheet(context).then((v){
                        setState(() {
                          gender=v;
                          print('$gender');
                        });
                      }
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 48,
            padding: EdgeInsets.only(left:8),
            child: Row(
              children: <Widget>[
                Text(
                  '年龄',
                  style: TextStyle(color: Color(0xff4D4D4D), fontSize: 14.0),
                ),
                Spacer(),
                InkWell(
                  child: Text(
                   age  == null ? '3岁': '$age岁',
                    style: TextStyle(color: Color(0xffBFBFBF), fontSize: 14.0),
                  ),
                  onTap: ()=>_bottomSelector(context).then((v){
                    setState(() {
                      age=v;
                      print('$age');
                    });
                  },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
///性别
_bottomSheet(context) async{
 var result=await showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
      ),
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 15, bottom: 13),
              child: Text(
                '性别',
                style: TextStyle(
                  color: Color(0xffBFBFBF),
                  fontSize: 14,
                ),
              ),
            ),
            InkWell(
              child: Container(
                margin: EdgeInsets.only(top: 13, bottom: 13),
                child: Text(
                  '男',
                  style: TextStyle(
                    color: Color(0xff595959),
                    fontSize: 16,
                  ),
                ),
              ),
              onTap: ()=>pop(0),
            ),
            InkWell(
              child: Container(
                margin: EdgeInsets.only(top: 13, bottom: 13),
                child: Text(
                  '女',
                  style: TextStyle(
                    color: Color(0xff595959),
                    fontSize: 16,
                  ),
                ),
              ),
              onTap: ()=>pop(1),
            ),
            Container(
              height: 8,
              color: Color(0xff8C8C8C).withOpacity(0.4),
              margin: EdgeInsets.symmetric(vertical: 10),
            ),
            FlatButton(
              child: Text(
                '取消',
                style: TextStyle(
                  color: Color(0xff8C8C8C),
                  fontSize: 16,
                ),
              ),
              onPressed: ()=>pop(),
            )
          ],
        );
      },
     );
 return result;
}
///年龄
_bottomSelector(context) {
  var total;
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
          height: 300,
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(vertical: 15),
                child: Text(
                  '年龄',
                  style: TextStyle(color: Color(0xffBFBFBF), fontSize: 14.0),
                ),
              ),
              Expanded(
                child: CupertinoPicker(
                    itemExtent: 50,  //
                    onSelectedItemChanged: (index) {
                      total=index+1;
                      print(total);
                    },
                    children:List.generate(18, (index){
                      return Container(
                      alignment: Alignment.center,
                       child: Text('${index+1}',style: TextStyle( color: Color(0xff1890FF),),),
                      );
                }),
              ),
              ),
              Container(
                height: 8,
                color: Color(0xff8C8C8C).withOpacity(0.4),
                margin: EdgeInsets.symmetric(vertical: 10),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: FlatButton(
                      onPressed:  () =>pop(),
                      child: Text(
                        '取消',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xff8C8C8C),
                        ),
                      ),
                    ),
                  ),
                  VerticalLine(
                    color: Color(0xffD9D9D9),
                  ),
                  Expanded(
                    child: FlatButton(
                      onPressed:  () =>pop(total),
                      child: Text(
                        '确定',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xff1890FF),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      });
}
