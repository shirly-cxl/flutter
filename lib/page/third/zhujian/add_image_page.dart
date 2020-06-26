import 'package:flutter/material.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class AddImagePage extends StatefulWidget {
  @override
  _AddImagePageState createState() => _AddImagePageState();
}

class _AddImagePageState extends State<AddImagePage> {
  List<Asset> images = List<Asset>();

  Widget buildGridView() {
    return GridView.count(
      crossAxisCount: 4,
      children: List.generate((images.length+1), (index) {
        if(index==0){
          return  GestureDetector(
            onTap: loadAssets,
            child: Container(
              width: 90,
              height: 90,
              color: Color.fromRGBO(250,250,250,1),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("选择相册",style: TextStyle(
                        fontSize: 12,
                        color: Color.fromRGBO(191,191,191,1)
                    ),),
                    Icon(Icons.keyboard_arrow_down,color: Color.fromRGBO(191,191,191,1))
                  ],
                ),
              ),
            ),
          );
        }else{
          return Container(
            padding: EdgeInsets.all(2.5),
            child: AssetThumb(
              asset: images[index-1],
              width: 300,
              height: 300,
            ),
          );
        }
      }),
    );
  }

  Future<void> loadAssets() async {
    List<Asset> resultList = List<Asset>();
    String error = 'No Error Dectected';

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 300,
        enableCamera: true,
        selectedAssets: images,
        cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
        materialOptions: MaterialOptions(
          actionBarColor: "#abcdef",
          actionBarTitle: "Example App",
          allViewTitle: "All Photos",
          useDetailsView: false,
          selectCircleStrokeColor: "#000000",
        ),
      );
    } on Exception catch (e) {
      error = e.toString();
    }
    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      images = resultList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar:AppBar(
          title: Text('添加图片',style: TextStyle(
              fontSize: 18,color: Colors.black
          ),),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
          leading: Center(
            child: GestureDetector(
                onTap: ()=> Navigator.pop(context),
                child: Text('取消',style: TextStyle(
                    fontSize: 16,color: Color.fromRGBO(77,77,77,1)
                ),)),
          ),
          actions: <Widget>[
            InkWell(
              child: Center(
                child: Text('确认',style: TextStyle(
                    fontSize: 16,color: Color.fromRGBO(77,77,77,1)
                ),),
              ),
              onTap: ()=> Navigator.pop(context),
            ),
            SizedBox(width: 16,),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: buildGridView(),
            ),
          ],
        ),
      ),
    );
  }
}