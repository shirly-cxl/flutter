import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:quill_delta/quill_delta.dart';
import 'package:total/util/tools.dart';
import 'package:total/widget/zefyr/edit_rich_view_widget.dart';
import 'package:zefyr/zefyr.dart';

//富文本
class EditRichPage extends StatefulWidget {
  @override
  _EditRichPageState createState() => _EditRichPageState();
}

class _EditRichPageState extends State<EditRichPage> {
  static Delta getDelta() =>
      Delta.fromJson(json.decode(r'[{"insert":"\n"}]') as List);

  final ZefyrController _controller =
  ZefyrController(NotusDocument.fromDelta(getDelta()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavigationBar(
        title: '富文本',
      ),
      body: ListView(
        children: <Widget>[
          new Container(
            margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
            height: MediaQuery.of(context).size.height * 0.4,
            child: new EditRichView(
              contentC: _controller,
              hintText: '请编辑内容',
            ),
          ),
        ],
      ),
    );
  }
}
