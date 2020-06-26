import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:total/util/tools.dart';

///
/// 对话框
void themeAlert<T>(
  BuildContext context, {
  String warmStr,
  String okBtn,
  String cancelBtn,
  Function okFunction,
  Function cancelFunction,
  TextStyle style,
}) {
  showDialog(
    context: context,
    builder: (context) {
      if (!strNoEmpty(okBtn)) okBtn = '确定';
      if (!strNoEmpty(cancelBtn)) cancelBtn = '取消';
      if (!strNoEmpty(warmStr)) warmStr = '温馨提示';
      assert(okFunction != null && cancelBtn != null);
      return Material(
          type: MaterialType.transparency, //透明类型
          child: Center(
            child: Container(
              width: 269,
              height: 150,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(5)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: (35),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: (20)),
                    child: Text(
                      warmStr ?? '温馨提示',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: (16), color: Color(0xffFF24262E)),
                    ),
                  ),
                  SizedBox(
                    height: (10),
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                          child: Container(
                        decoration: BoxDecoration(
                            color: Color(0xffFFF7F8FA),
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(5))),
                        child: FlatButton(
                          child: Text(
                            cancelBtn ?? '取消',
                            style: TextStyle(fontSize: 16),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                            cancelFunction();
                          },
                        ),
                      )),
                      Expanded(
                          child: Container(
                        decoration: BoxDecoration(
                            color: Color(0xffFFC0984E),
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(5))),
                        child: FlatButton(
                          child: Text(
                            okBtn ?? '确定',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                            okFunction();
                          },
                        ),
                      )),
                    ],
                  )
                ],
              ),
            ),
          ));
    },
  );
}
