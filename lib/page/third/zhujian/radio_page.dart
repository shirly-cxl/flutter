import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:total/util/tools.dart';

class RadioPage extends StatefulWidget {
  @override
  _RadioPageState createState() => _RadioPageState();
}

class _RadioPageState extends State<RadioPage> {
  int radio = 1;
  bool check=false,checkSwitch=true,checkCupertinoSwitch=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new NavigationBar(title: '单选框/复选框/开关'),
      body: ListView(
        children: <Widget>[
          Container(
            color: Colors.white,
            child: Column(
              children: <Widget>[
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        '公益类',
                        style: TextStyle(fontSize: 16),
                      ),
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
                Container(
                    child: radio == 1
                        ? Column(
                      children: <Widget>[
                        Table(
                          title: '公益方向',
                        ),
                        Table(
                          title: '资金处理',
                        ),
                      ],
                    )
                        : Container()),
              ],
            ),
          ),
          Container(
            color: Colors.white,
            margin: EdgeInsets.only(top: 8),
            child: Column(
              children: <Widget>[
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        '聚会类',
                        style: TextStyle(fontSize: 16),
                      ),
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
                Container(
                    child: radio == 0
                        ? Table(
                      title: '费用说明',
                    )
                        : Container()),
              ],
            ),
          ),
          Row(
            children: <Widget>[
              Checkbox(
                onChanged: (bool v){
                 setState(() {
                   check=!check;
                 });
                },
                value: check,
              ),
              UnconstrainedBox(
                child: Switch(
                    value: checkSwitch,
                    onChanged: (v){
                      setState(() {
                        checkSwitch=!checkSwitch;
                      });
                    }),
              ),
              CupertinoSwitch(
                  value: checkCupertinoSwitch,
                  onChanged: (v){
                    setState(() {
                      checkCupertinoSwitch=!checkCupertinoSwitch;
                    });
                  }),
            ],
          ),
        ],
      ),
    );
  }
}


class Table extends StatelessWidget {
  final String title;
  const Table({
    Key key,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            title,
            style:
            TextStyle(fontSize: 14, color: Color.fromRGBO(89, 89, 89, 1)),
          ),
          Image.network(
            'https://img02.mockplus.cn/idoc/xd/2020-06-03/895f111f-6c3b-4a34-b92e-0873f1f1a526.png',
            height: 14,
            width: 8,
          ),
        ],
      ),
    );
  }
}