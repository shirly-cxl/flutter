import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:total/util/tools.dart';

class HobbyPage extends StatefulWidget {
  @override
  _HobbyPageState createState() => _HobbyPageState();
}

class _HobbyPageState extends State<HobbyPage> {
  TextEditingController _controller = new TextEditingController();
  TextEditingController textC = new TextEditingController();
  String title;
  List _list=[
    {'title':'美食', 'choose':true,},
    {'title':'烹饪', 'choose':false,},
    {'title':'健身', 'choose':false,},
    {'title':'瑜伽', 'choose':false,},
    {'title':'娱乐', 'choose':false,},
    {'title':'萌宠', 'choose':false,},
    {'title':'汽车', 'choose':false,},
    {'title':'旅行', 'choose':false,},
  ];
  List _painting=[
    {'title':'绘画', 'choose':false,},
    {'title':'钢琴', 'choose':false,},
    {'title':'吉他', 'choose':false,},
    {'title':'舞蹈', 'choose':false,},
    {'title':'手工', 'choose':true,},
    {'title':'软陶', 'choose':false,},
    {'title':'摄影', 'choose':false,},
    {'title':'电影', 'choose':false,},
  ];
  List<String> data = ['爱好', 'ok'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color(0xffE9E9E9),
      appBar: new NavigationBar(title: '兴趣爱好'),
      body: ListView(
        padding: EdgeInsets.all(0),
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 10,left: 16,right: 16),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '爱好综述',
                  style: TextStyle(
                      fontSize: 16,
                      color: Color(0xff262626),
                      fontWeight: FontWeight.bold
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric( vertical: 8),
                  decoration: BoxDecoration(
                    color: Color(0xffE9E9E9),
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  child: new TextField(
                    controller: _controller,
                    maxLength: 200,
                    maxLines: 4,
                    decoration: const InputDecoration(
                      hintText: '输入您的爱好综述',
                      helperStyle: TextStyle(
                        fontSize: 14,
                        color: Color(0xffBFBFBF),
                      ),
                      hintStyle: TextStyle(
                        fontSize: 14,
                        color: Color(0xff8C8C8C),
                      ),
                      contentPadding: const EdgeInsets.only(left: 8.0,top: 8),
                      border: InputBorder.none,
                    ),
                    onChanged: (val) {
                      print(val);
                    },
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10,),
            padding: EdgeInsets.only(left: 16,right: 16),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Space(),
                Text(
                  '可选爱好',
                  style: TextStyle(
                      fontSize: 16,
                      color: Color(0xff262626),
                  ),
                ),
                Space(height: 15,),
                ButtonWidget(
                  title: '生活',
                  subTitle: '1',
                  value: false,
                  list: _list,
                ),
                ButtonWidget(
                  title: '艺术',
                  value: false,
                  list: _painting,
                ),
              ],
            ),
          ),
          Space(),
          Container(
            color: Colors.white,
            padding: EdgeInsets.only(top: 13,left: 16,right: 16,bottom: 13),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      '自选爱好',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xff262626),
                      ),
                    ),
                    Text(
                      '1',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xff1890FF),
                      ),
                    ),
                    Spacer(),
                    InkWell(
                      onTap: (){
                        showDialog(
                          context:context,
                        builder: (BuildContext context){
                          return Material(
                            color: Colors.transparent,
                            child: CupertinoAlertDialog(
                              content:Column(
                                children: <Widget>[
                                  Text('自选爱好',style: TextStyle(color: Color(0xff595959)),),
                                  Container(
                                    margin: EdgeInsets.only(top: 10),
                                    height: 40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(5),
                                      ),
                                      border: Border.all(color: Colors.grey)
                                    ),
                                    child:  TextField(
                                      controller: textC,
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
                                          setState(() => data.insert(data.length, str));
                                          },
                                      onChanged: (str){
                                        title=str;
                                        if(textC.text.length >4){
                                          showToast(context, '只能输入1~4字');
                                        }
                                        print(title);
                                      },
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        helperText:'输入1~4字',
                                        contentPadding: const EdgeInsets.only(left: 8.0,),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              actions:<Widget>[
                                CupertinoDialogAction(
                                  child: Text('取消',style: TextStyle(color: Color(0xff8C8C8C)),),
                                  onPressed: ()=> Navigator.of(context).pop(),
                                ),

                                CupertinoDialogAction(
                                  child: Text('确认',),
                                  onPressed: (){
                                    setState(() => data.insert(data.length, title));
                                    Navigator.of(context).pop(title);
                                  },
                                ),
                              ],
                            ),
                          );
                          });
                      },
                        child: Icon(Icons.add_circle_outline,color: Color(0xff8C8C8C),size: 18,)
                    ),
                  ],
                ),
                Space(),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: List.generate(data.length, (index){
                    return LikeWidget(
                      title: data[index],
                      onTap: (){
                        setState(() {
                          data.removeAt(index);
                        });
                      },
                    );
                  })
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class LikeWidget extends StatelessWidget {
  final String title;
  final Function onTap;
  LikeWidget({Key key, this.title, this.onTap,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 87,
      height: 26,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        color: Color(0xff1890FF),
      ),
      child: Stack(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(right: 10),
            child: Text(
              '$title',
              style: TextStyle(
                fontSize: 12,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            right: 5,
            top: 5,
            child: InkWell(
              onTap: onTap,
              child: Icon(Icons.cancel,color: Colors.white,size: 16,),
            ),
          )
        ],
      ),

    );
  }
}


class ButtonWidget extends StatefulWidget {
  final List list;
  final String title;
  final String subTitle;
  bool value=false;
  ButtonWidget({Key key, this.list, this.title,this.subTitle,this.value}) : super(key: key);
  @override
  _ButtonWidgetState createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.only(bottom: 5,),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                '${widget.title}',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xff262626),
                ),
              ),
              Space(),
              widget.subTitle==null
              ? Container()
              : Text(
                '${widget.subTitle}',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xff1890FF),
                ),
              ),
              Spacer(),
              InkWell(
                  child: Icon(
                    widget.value==false
                    ?Icons.chevron_right
                    :Icons.expand_more,
                    color: Color(0xffBFBFBF),
                    size: 20,),
                  onTap: (){
                    setState(() {
                      widget.value = !widget.value;
                    });
                  })
            ],
          ),
          Space(height: 15,),
          widget.value ==false
          ? Container()
          :Center(
            child: Wrap(
              runSpacing: 8,
              spacing: 20,
              children: widget.list.map((item){
                return InkWell(
                  child: Container(
                    width: 66,
                    height: 26,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: item["choose"] ==false ?Color(0xffE9E9E9): Color(0xff1890FF),
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                    child: Text(
                      item["title"],
                      style: TextStyle(
                        fontSize: 12,
                        color:item["choose"] ==false ? Color(0xff8C8C8C) :Colors.white,
                      ),
                    ),
                  ),
                  onTap: (){
                    setState(() {
                      if (item["choose"] == true) {
                        item["choose"] = false;
                      } else {
                        item["choose"] = true;
                      }
                    });
                  },
                );
              }).toList(),
            ),
          )
        ],
      ),
    );
  }
}
