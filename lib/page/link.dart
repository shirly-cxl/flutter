

//文本输入框TextField属性:
//https://blog.csdn.net/yuzhiqiang_1993/article/details/88204031

//面对面建群
//https://flutterawesome.com/a-flutter-package-that-help-you-create-a-verification-input/

//按钮属性:
//https://blog.csdn.net/yuzhiqiang_1993/article/details/85004313

/// 封装图片面板
//  _generateImages() {
//    return _images.map((file){
//      return Stack(
//        children: <Widget>[
//          ClipRRect(
//            borderRadius: BorderRadius.circular(10),
//            child: Image.file(
//                file,
//                width: 90,height: 90,
//                fit:BoxFit.cover,
//            ),
//          ),
//          Positioned(
//            right: 5,
//            top: 5,
//            child: GestureDetector(
//              onTap: (){
//                setState(() {
//                  _images.remove(file);
//                });
//              },
//              child: ClipOval(
//                child: Container(
//                  padding: EdgeInsets.all(5),
//                  decoration: BoxDecoration(color: Colors.black54),
//                  child: Icon(Icons.close,size: 15,color: Colors.white,),
//                ),
//              ),
//            ),
//          ),
//        ],
//      );
//    }).toList();
//  }