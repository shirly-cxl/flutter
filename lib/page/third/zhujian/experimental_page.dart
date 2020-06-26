import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:total/util/tools.dart';

class ExperimentalPage extends StatefulWidget {
  @override
  _ExperimentalPageState createState() => _ExperimentalPageState();
}

class _ExperimentalPageState extends State<ExperimentalPage> {
  bool isUnfold = false;
  String good =
      ' 分析源码可知，SizeBox 继承自 SingleChildRenderObjectWidget 仅提供子 Child 的存储并不提供更新逻辑；且 SizedBox 提供了多种使用方法，小菜逐一尝试案例尝试1. SizedBox({ Key key, this.width, this.height, Widget child })      SizedBox 可自定义 width 和 height，当限制宽高时，子 Widget 无论宽高如何，均默认填充；通过设置 double.infinity 填充父类 Widget 宽高，注意此时父类要有限制，不可是无限宽高；当 width 和 height 未设置时，根据子 Widget 大小展示；作者：阿策神奇链接：https://www.jianshu.com/p/21c42587d9ee来源：简书著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。';
  List fee = [
    {"tip": "购买本卷",
      "feetitle": "按卷收费",
      "fee": 2.00,
      "choose": false},
    {
      "tip": "订阅折扣1",
      "feetitle": "订阅10卷",
      "fee": 45.00,
      "feeadd": "/10卷",
      "choose": false
    },
    {
      "tip": "订阅折扣2",
      "feetitle": "订阅20卷",
      "fee": 85.00,
      "choose": false,
      "feeadd": "/20卷"
    },
    {"tip": "订阅折扣3", "feetitle": "订阅本连载", "fee": 300.00, "choose": false}
  ];
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new NavigationBar(title: '伸缩'),
        body: ListView(
          children: <Widget>[
            Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                color: Colors.white,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Image.network(
                      "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3166066774,836860189&fm=26&gp=0.jpg",
                      fit: BoxFit.cover,
                      height: MediaQuery.of(context).size.height / 4 - 20,
                      width: MediaQuery.of(context).size.width / 3.5,
                    ),
                    SizedBox(width: 10,),
                    Expanded(
                      child: Stack(
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("作品简介",style: TextStyle(fontSize: 14),),
                              SizedBox(height:5),
                              Container(
                                margin: EdgeInsets.all(8),
                                child: Text(
                                  good,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: isUnfold?50:6,
                                  style: TextStyle(fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                          Positioned(
                            child:
                            GestureDetector(child: Icon(isUnfold?Icons.expand_less:Icons.expand_more, color: Colors.black54),onTap: (){
                              setState(() {
                                isUnfold = !isUnfold;
                              });
                            },),
                            right: 0,
                            bottom: 0,
                          )
                        ],
                      ),
                    )
                  ],
                )),
            SizedBox(
              height: 20,
            ),
            Chapter(
              list: fee,
              volume: "第1卷",
              chapterNumber: "共20个章节",
              mode: "本章免费试读",
            ),
            Chapter(
              list: fee,
              volume: "第2卷",
              chapterNumber: "共20个章节",
            )
          ],
        ));
  }
}

class Chapter extends StatefulWidget {
  final List list;
  final String volume;
  final String chapterNumber;
  final String mode;

  const Chapter(
      {Key key, this.list, this.volume, this.chapterNumber, this.mode})
      : super(key: key);
  @override
  _ChapterState createState() => _ChapterState();
}

class _ChapterState extends State<Chapter> {
  double pirce = 0.00;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[100],
      margin: EdgeInsets.only(bottom: 20),
      child: ExpansionTile(
        backgroundColor: Colors.transparent,
        title: Text(
          widget.volume,
          style: TextStyle(fontSize: 14, color: Colors.black),
        ),
        subtitle: Row(
          children: <Widget>[
            Text(
              widget.chapterNumber,
              style: TextStyle(fontSize: 10, color: Colors.grey[400]),
            ),
            SizedBox(
              width: 10,
            ),
            widget.mode != null
                ? Text(
              widget.mode,
              style: TextStyle(fontSize: 10, color: Colors.blue),
            )
                : Container()
          ],
        ),
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.grey[200],
            padding: EdgeInsets.all(16),
            child: Column(
              children: <Widget>[
                Text(
                  "购买本卷",
                  style: TextStyle(fontSize: 16, color: Color(0xff4D4D4D)),
                ),
                SizedBox(height: 18),
                Wrap(
                    spacing: 20,
                    runSpacing: 15,
                    children: widget.list.map((item) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            if (item["choose"] == true) {
                              return;
                            } else {
                              item["choose"] = true;
                              pirce = item["fee"];
                            }
                            widget.list.forEach((inItem) {
                              if (inItem["feetitle"] != item["feetitle"]) {
                                setState(() {
                                  inItem["choose"] = false;
                                });
                              }
                            });
                          });
                        },
                        child: Stack(
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: 2,
                                    color: item["choose"]
                                        ? Colors.blue
                                        : Colors.grey[200]),
                                borderRadius:
                                BorderRadius.all(Radius.circular(10)),
                                color: Colors.white,
                              ),
                              height: (MediaQuery.of(context).size.width - 60) /
                                  2 /
                                  1.6 *
                                  1.2,
                              width:
                              (MediaQuery.of(context).size.width - 60) / 2,
                            ),
                            Container(
                              padding: EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                  color: item["choose"]
                                      ? Colors.blue
                                      : Colors.grey[300],
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10))),
                              child: Text(
                                item["tip"],
                                style: TextStyle(
                                    color: Colors.white, fontSize: 10),
                              ),
                            ),
                            Container(
                              height: (MediaQuery.of(context).size.width - 60) /
                                  2 /
                                  1.6 *
                                  1.2,
                              width:
                              (MediaQuery.of(context).size.width - 60) / 2,
                              padding: EdgeInsets.only(
                                top: (MediaQuery.of(context).size.width - 60) /
                                    2 /
                                    5.5,
                                bottom:
                                (MediaQuery.of(context).size.width - 60) /
                                    2 /
                                    6.5,
                              ),
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    item["feetitle"],
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: item["choose"]
                                            ? Colors.blue
                                            : Color(0xff595959)),
                                  ),
                                  Spacer(),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        "￥",
                                        style: TextStyle(
                                            fontSize: 17,
                                            color: item["choose"]
                                                ? Colors.blue
                                                : Color(0xff595959)),
                                      ),
                                      Text(
                                        item["fee"].toString(),
                                        style: TextStyle(
                                            fontSize: 17,
                                            color: item["choose"]
                                                ? Colors.blue
                                                : Color(0xff595959)),
                                      ),
                                      item["feeadd"] != null
                                          ? Text(
                                        item["feeadd"],
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: item["choose"]
                                                ? Colors.blue
                                                : Color(0xff595959)),
                                      )
                                          : Container()
                                    ],
                                  ),
                                  Spacer(),
                                  item["choose"]
                                      ? Icon(
                                    Icons.format_align_right,
                                    color: Colors.blue,
                                    size: 13,
                                  )
                                      : SizedBox(height: 13)
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    }).toList()),
                SizedBox(
                  height: 16,
                ),
                Container(
                  height: 44,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.white),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "支付总额:",
                        style:
                        TextStyle(color: Color(0xff8C8C8C), fontSize: 12),
                      ),
                      Text(
                        "￥",
                        style: TextStyle(color: Colors.blue, fontSize: 18),
                      ),
                      Text(
                        pirce.toString(),
                        style: TextStyle(color: Colors.blue, fontSize: 18),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Container(
                  child: RaisedButton(
                    onPressed: () {},
                    child: Text(
                      "支付",
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                    color: Colors.blue,
                  ),
                  width: MediaQuery.of(context).size.width / 4,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
