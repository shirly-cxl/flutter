import 'package:flutter/material.dart';
import 'package:total/util/tools.dart';


class LoadingDialog extends Dialog {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
//      type: MaterialType.transparency,
      child: Stack(
        children: <Widget>[
          InkWell(
            onTap: ()=>pop(),
          ),
          new Center(
            ///弹框大小
            child: new SizedBox(
              width: 120.0,
              height: 120.0,
              child: new Container(
                ///弹框背景和圆角
                decoration: ShapeDecoration(
                  color: Color(0xffffffff),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8.0),
                    ),
                  ),
                ),
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new CircularProgressIndicator(),
                    new Padding(
                      padding: const EdgeInsets.only(
                        top: 20.0,
                      ),
                      child: new Text(
                        "加载中",
                        style: new TextStyle(fontSize: 16.0),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}