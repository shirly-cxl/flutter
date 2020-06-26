import 'package:flutter/material.dart';
import 'package:total/common/global_variable.dart';
import 'package:total/util/tools.dart';

class LoadingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new SizedBox(
      width: winWidth(context),
      height: 300,
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(themeColor),
          ),
          new Space(),
          new Text(
            '加载中',
            style: TextStyle(color: themeColor),
          ),
        ],
      ),
    );
  }
}
