import 'package:flutter/material.dart';
import 'package:total/util/tools.dart';

class MyEditRichPage extends StatefulWidget {
  @override
  _MyEditRichPageState createState() => _MyEditRichPageState();
}

class _MyEditRichPageState extends State<MyEditRichPage> {

  RichTextList<CustomTypeList> textList = RichTextList()..initial();
  int currentPosition = 0;
  TextEditingController currentController;
  final String imageOne = "https://img02.mockplus.cn/idoc/xd/2020-06-16/1a6fc984-c968-4cab-ba28-aaaaa3bb0dd9.png";
  final String imageTwo = "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1555479650844&di=14ab3c085831c70e54636b9765df0759&imgtype=0&src=http%3A%2F%2Fimg1.gamersky.com%2Fupimg%2Fusers%2F2019%2F04%2F05%2Fsmall_201904052229268707.jpg";
  final String imageThree = "https://img02.mockplus.cn/idoc/xd/2020-06-16/deb4b135-32b2-4144-adc6-03f6a5d341ff.png";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavigationBar(
        title: '自定义富文本',
      ),
      body: Container(
        child:ListView.builder(
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
                        color: Colors.red,
                        onPressed: (){
                          textList.remove(position);
                          setState(() {});
                        }),
                  ),
                ],
              );
            }
            else{
              return Container();
            }
          },
          scrollDirection: Axis.vertical,
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            heroTag: "single",
            onPressed: (){
              if(currentController == null) return;
              textList.insertOne(currentPosition, getBeforeText(currentController), getSelectText(currentController),
                  getAfterText(currentController), CustomTypeList(flag: TypeFlag.image,
                      imageUrl: imageOne));
              setState(() {
              });
            },
            tooltip: '插入',
            child: Icon(Icons.add),
          ),
          FloatingActionButton(
            heroTag: "multi",
            onPressed: (){
              if(currentController == null) return;
              textList.insert(currentPosition,
                  getBeforeText(currentController),
                  getSelectText(currentController),
                  getAfterText(currentController),
                  [CustomTypeList(flag: TypeFlag.image, imageUrl: imageTwo),
                    CustomTypeList(flag: TypeFlag.image, imageUrl: imageThree)]);
              setState(() {
              });
            },
            tooltip: '插入',
            child: Icon(Icons.add_to_photos),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
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
  final FocusNode _focusNode = FocusNode();

  TextItem(this.index, this._entry, this.focusCallBack){
    _controller.text = _entry.value;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: new TextField(
        controller: _controller,
        onChanged: (text) => _entry.value = text,
        keyboardType: TextInputType.multiline,
        textDirection: TextDirection.ltr,
        maxLines: null,
        autofocus: index == 0 ? true : false,
        focusNode: _focusNode..addListener(() {
          if (_focusNode.hasFocus) {
            focusCallBack(index, _controller);
            print("当前选择的是:${index}");
          }
        }),
        decoration: InputDecoration(
          hintText: index == 0 ? "在这里开始..." : "在这里继续...",
          border: InputBorder.none,
        ),
      ),
    );
  }
}

class CustomTypeList{
  TypeFlag flag;//默认为文字——0：文字，1：图片，2：视频，3：音乐
  var imageUrl;
  CustomTypeList({this.flag = TypeFlag.text, this.imageUrl = ""});
}

enum TypeFlag{
  text,
  image,
  video,
  music
}

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
    if (currentPosition < 0) throw ArgumentError("数字[${currentPosition}]不合法");
    if (currentPosition >= _list.length) throw ArgumentError(
        "[${currentPosition}]数组越界了");
    if (t == null) throw ArgumentError("插入数据不能为空");
    _list[currentPosition].value = beforeText;
    _list.insert(currentPosition + 1, TextEntry(t, ""));
    _list.insert(currentPosition + 2, new TextEntry(null, afterText));
  }

  void insert(int currentPosition, String beforeText, String selectText,
      String afterText, List<T> list) {
    if (_list.length == 0) throw UnsupportedError("列表尚未初始化");
    if (currentPosition < 0) throw ArgumentError("数字[${currentPosition}]不合法");
    if (currentPosition >= _list.length) throw ArgumentError(
        "[${currentPosition}]数组越界了");
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
      String afterText = _list[currentPosition + 1].value;
      _list[currentPosition - 1].value += afterText;
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