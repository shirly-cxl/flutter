import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:total/util/tools.dart';

class SingleImagePage extends StatefulWidget {
  @override
  _SingleImagePageState createState() => _SingleImagePageState();
}

class _SingleImagePageState extends State<SingleImagePage> {
  //记录每次选择的图片
//  List<File> _images = [];
  List _images = [];
  //相册选择
  Future getImage(bool isTakePhoto) async {
    var image = await ImagePicker.pickImage(
        source: isTakePhoto ? ImageSource.camera : ImageSource.gallery
    );
    if(image !=null){
      setState(() {
        // _image = image;
        _images.add(image);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: new NavigationBar(
        title: '添加图片',
        mainColor: Colors.black,
        backgroundColor: Colors.white,
        rightDMActions: <Widget>[
          InkWell(
              onTap: () {
                print('确定');
              },
              child: Container(
                  margin: EdgeInsets.only(right: 10, top: 10),
                  child: Text('确定', style: TextStyle(
                      fontSize: 16, color: Color(0xff4D4D4D)),))),
        ],
        leading: Container(
          margin: EdgeInsets.only(left: 16, top: 10),
          child: InkWell(
            onTap: () => pop(),
            child: Text(
              '取消', style: TextStyle(fontSize: 16, color: Color(0xff4D4D4D)),),
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(0),
        children: <Widget>[
          Container(
            child: Wrap(
              spacing: 5,
              runSpacing: 5,
              children: List.generate((_images.length+1), (index){
                if (index == 0) {
                  return GestureDetector(
                    onTap: () => getImage(false),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xffEBEBEB),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      width: (winWidth(context)-20)/4,
                      height: (winWidth(context)-20)/4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('选择相册',
                            style: TextStyle(fontSize: 12,color: Color(0xffBFBFBF)),),
                          Space(height: 5,),
                          Image.network(
                            'https://img02.mockplus.cn/idoc/xd/2020-06-16/ee27935c-f240-4cd6-a80c-f7d638726221.png',
                            width: 14,height: 8,fit: BoxFit.cover,),
                        ],
                      ),
                    ),
                  );
                } else
                  return Stack(
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.file(
                          _images[index-1],
                          width: (winWidth(context)-20)/4,
                          height:(winWidth(context)-20)/4,
                          fit:BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        right: 5,
                        top: 5,
                        child: GestureDetector(
                          onTap: (){
                            setState(() {
                              _images.removeAt(index-1);
                            });
                          },
                          child: ClipOval(
                            child: Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(color: Colors.black54),
                              child: Icon(Icons.close,size: 15,color: Colors.white,),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
              }),
            ),
          ),
        ],
      ),
    );
  }
}