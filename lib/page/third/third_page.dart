import 'package:total/util/tools.dart';
import 'package:flutter/material.dart';
import 'zhujian/add_image_page.dart';
import 'zhujian/audio_page.dart';
import 'zhujian/dialog_page.dart';
import 'zhujian/edit_rich_page.dart';
import 'zhujian/experimental_page.dart';
import 'zhujian/my_edit_rich_page.dart';
import 'zhujian/painter_page.dart';
import 'zhujian/path_page.dart';
import 'zhujian/qq_cannel_page.dart';
import 'zhujian/radio_page.dart';
import 'zhujian/single_image_page.dart';
import 'zhujian/video_page.dart';
import 'zhujian/nestedscrollview_page.dart';


class ThirdPage extends StatefulWidget {
  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  List data=[
    {'text':'ClipPath','onPressed':()=>routePush(PathPage()),},
    {'text':'Experimental','onPressed':()=>routePush(ExperimentalPage()),},
    {'text':'CustomPaint','onPressed':()=>routePush(PainterPage()),},
    {'text':'Dialog/OutlineButton','onPressed':()=>routePush(DialogPage()),},
    {'text':'Radio','onPressed':()=>routePush(RadioPage()),},
    {'text':'音频','onPressed':()=>routePush(AudioPage()),},
    {'text':'视频','onPressed':()=>routePush(VideoPage()),},
    {'text':'富文本','onPressed':()=>routePush(EditRichPage()),},
    {'text':'自定义富文本','onPressed':()=>routePush(MyEditRichPage()),},
    {'text':'单选图片','onPressed':()=>routePush(SingleImagePage()),},
    {'text':'多选图片','onPressed':()=>routePush(AddImagePage()),},
    {'text':'NestedScrollView','onPressed':()=>routePush(NestedScrollViewPage()),},
    {'text':'右滑删除','onPressed':()=>routePush(CancelPage()),},
//    {'text':'富文本','onPressed':()=>routePush(EditRichPage()),},
//    {'text':'视频','onPressed':()=>routePush(VideoPage()),},
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new NavigationBar(title: '各种组件/插件'),
      body: new ListView.builder(
        itemBuilder: (BuildContext context, int index){
          VoidCallback _onPressed=data[index]['onPressed'];
          var _text=data[index]['text'];
          return Container(
            margin: EdgeInsets.symmetric(vertical: 10,horizontal: 16),
            child: FlatButton(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Text(
                '$_text',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18),
              ),
              onPressed: _onPressed,
              color: Colors.blueAccent,
            ),
          );
        },
        itemCount: data.length,
      )
    );
  }
}
