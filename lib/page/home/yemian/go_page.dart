import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:total/util/tools.dart';

class GoPage extends StatefulWidget {
  @override
  _GoPageState createState() => _GoPageState();
}

class _GoPageState extends State<GoPage> {
  RichTextList<CustomTypeList> textList = RichTextList()..initial();
  int currentPosition = 0;
  TextEditingController currentController;

  final String imageOne = "https://img02.mockplus.cn/idoc/xd/2020-06-16/1a6fc984-c968-4cab-ba28-aaaaa3bb0dd9.png";
//记录选择的
  File _image;
  //拍照
  Future _getImageFromCamera() async {
    var image =
    await ImagePicker.pickImage(source: ImageSource.camera, maxWidth: 400);
    if(image !=null){
      setState(() {
        _image = image;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: false,
      appBar: new NavigationBar(
        title: '想去',
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
      body: Container(
        padding: EdgeInsets.only(left: 16,right: 16),
        child: Column(
          children: <Widget>[
            Container(
              height: 40,
              child: Row(
                children: <Widget>[
                  Text(
                    '详情',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xff262626),
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Space(width: 64,),
                  InkWell(
                      onTap:(){
//                        if(currentController == null) return;
                        textList.insertOne(currentPosition, getBeforeText(currentController), getSelectText(currentController),
                            getAfterText(currentController), CustomTypeList(flag: TypeFlag.image,
                                imageUrl: imageOne));
                        setState(() {
                        });
                        print('图片');
                      },
                      child: Image.network(
                        'https://img02.mockplus.cn/idoc/xd/2020-06-16/61889bad-30e6-440e-b7c9-e88e3ddf19e9.png',
                        width: 16,height: 16,)),
                  Space(width: 24,),
                  InkWell(
                      onTap:(){
                        print('2');
                      },
                      child: Image.network(
                        'https://img02.mockplus.cn/idoc/xd/2020-06-16/facf9b2d-b38d-4b65-87e1-f6a49fe68169.png',
                        width: 16,height: 16,)),
                  Space(width: 24,),
                  InkWell(
                      onTap:(){
                        print('3');
                      },
                      child: Image.network(
                        'https://img02.mockplus.cn/idoc/xd/2020-06-16/c7f3fb85-febe-49b5-a8fb-e7ddbdcbf182.png',
                        width: 16,height: 16,)),
                  Space(width: 24,),
                  InkWell(
                      onTap:(){
                        _getImageFromCamera();
                        print('4');
                      },
                      child: Image.network(
                        'https://img02.mockplus.cn/idoc/xd/2020-06-16/d0d465cc-15e6-4a7f-bb54-a670243d0f78.png',
                        width: 16,height: 16,)),
                ],
              ),
            ),
            Container(
              height: winHeight(context)*0.8,
              color: Color(0xffF5F5F5),
              child: ListView.builder(
                itemCount: textList.size,
                itemBuilder: (BuildContext context, int position) {
                  textList.list[position].key??=CustomTypeList();
                  if (textList.list[position].key.flag == TypeFlag.text) {
                    return TextItem(position, textList.list[position], (index, controller){
                      currentPosition = index;
                      currentController = controller;
                    });
                  } else if (textList.list[position].key.flag == TypeFlag.image) {
                    return Stack(
                      children: <Widget>[
                        Container(
                          child: Image.network(textList.list[position].key.imageUrl),
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: IconButton(
                              icon: Icon(Icons.cancel),
                              iconSize: 35,
                              color: Colors.white,
                              onPressed: (){
                                textList.remove(position);
                                setState(() {});
                              }),
                        ),
                      ],
                    );
                  }else{
                    return Container();
                  }
                },
                scrollDirection: Axis.vertical,
              ),
            ),
          ],
        ),
      ),
    );
  }
  String getAfterText(TextEditingController controller) {
    return controller?.selection?.textAfter(controller.text);
  }

  String getSelectText(TextEditingController controller) {
    return controller?.selection?.textInside(controller.text);
  }

  String getBeforeText(TextEditingController controller) {
    return controller?.selection?.textBefore(controller.text);
  }
}


class TextItem extends StatelessWidget {
  final int index;
  final TextEntry<CustomTypeList, String> _entry;
  final Function focusCallBack;
  final TextEditingController _controller = TextEditingController();
  TextItem(this.index, this._entry, this.focusCallBack){
    _controller.text = _entry.value;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: new TextField(
        controller: _controller,
        onChanged: (text) {
          _entry.value = text;
          print(_entry.value);
        },
        keyboardType: TextInputType.multiline,
        textDirection: TextDirection.ltr,
        maxLines: null,
        decoration: InputDecoration(
          hintText: index == 0 ? "" : "开始...",
          border: InputBorder.none,
        ),
      ),
    );
  }
}


class CustomTypeList{
  TypeFlag flag;//默认为文字——0：文字，1：图片，2：链接，3：拍照
  var imageUrl;
  CustomTypeList({this.flag = TypeFlag.text, this.imageUrl = ""});
}

enum TypeFlag{ text, image, link, take }

class TextEntry<K, V> {
  K key;
  V value;
  factory TextEntry(K key, V value) = TextEntry<K, V>._;
  TextEntry._(this.key, this.value);
  String toString() => "TextEntry($key: $value)";
}


class RichTextList<T> {
  List<TextEntry<T, String>> _list = [];

  void initial() {
    if (_list.length > 0) throw UnsupportedError("列表已被初始化过");
    _list.add(TextEntry(null, ""));
  }

  void initialList(List<TextEntry<T, String>> textPicList) {
    if (_list.length > 0) throw UnsupportedError("列表已被初始化过");
    _list = List.from(textPicList);
  }

  void insertOne(int currentPosition, String beforeText, String selectText,
      String afterText, T t) {
    if (_list.length == 0) throw UnsupportedError("列表尚未初始化");
    if (currentPosition < 0) throw ArgumentError("数字[$currentPosition]不合法");
    if (currentPosition >= _list.length) throw ArgumentError(
        "[$currentPosition]数组越界了");
    if (t == null) throw ArgumentError("插入数据不能为空");
    _list[currentPosition].value = beforeText;
    _list.insert(currentPosition + 1, TextEntry(t, ""));
    _list.insert(currentPosition + 2, new TextEntry(null, afterText));
  }

  void insert(int currentPosition, String beforeText, String selectText,
      String afterText, List<T> list) {
    if (_list.length == 0) throw UnsupportedError("列表尚未初始化");
    if (currentPosition < 0) throw ArgumentError("数字[$currentPosition]不合法");
    if (currentPosition >= _list.length) throw ArgumentError(
        "[$currentPosition]数组越界了");
    if (list == null) throw ArgumentError("插入列表不能为空");
    if (list.length == 0) return;
    _list[currentPosition].value = beforeText;
    for (int i = 0; i < list.length; i++) {
      _list.insert(currentPosition + 2 * i + 1, TextEntry(list[i], ""));
      _list.insert(currentPosition + 2 * i + 2,
          new TextEntry(null, i == list.length - 1 ? afterText : ""));
    }
  }

  void remove(int currentPosition) {
    if (_list.length == 0) throw UnsupportedError("列表尚未初始化");
    if (currentPosition >= _list.length) throw ArgumentError("长度超过了呀！");
    if (currentPosition <= 0) throw Exception("不应该删除第一个！");
    if (currentPosition < _list.length - 1) {
//      String afterText = _list[currentPosition + 1].value;
//      _list[currentPosition - 1].value += afterText;
      _list.removeAt(currentPosition + 1);
      _list.removeAt(currentPosition);
    } else if (currentPosition == _list.length - 1) throw UnsupportedError(
        "不应该删除的是最后一个！");
  }


  List<TextEntry<T, String>> get list => _list;

  int get size => _list.length;

  void printListText() {
    for (TextEntry<T, String> t in _list) {
      print("${t.value} \n");
    }
  }

  @override
  String toString() {
    return 'TextPicList{_textPicList: $_list}';
  }
}