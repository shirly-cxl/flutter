import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:total/util/tools.dart';

void confirmAlert<T>(
  BuildContext context,
  VoidCallbackConfirm callBack, {
  String tips,
  String okBtn,
  String cancelBtn,
  bool input,
  int length, //输入类别名字长度
  double hintTextSize, //文字大小
  GestureTapCallback onTap,
  TextEditingController controller,
  ValueChanged<String> onChanged,
}) {
  showDialog<T>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      if (!strNoEmpty(okBtn)) okBtn = '确定';
      if (!strNoEmpty(cancelBtn)) cancelBtn = '取消';
      TextStyle _style(Color color) {
        return TextStyle(color: color, fontSize: 16.0);
      }

      return Material(
        type: MaterialType.transparency,
        child: CupertinoAlertDialog(
          content: new Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(vertical: 15.0),
            child: Column(
              children: <Widget>[
                Text(
                  '$tips',
                  style: TextStyle(color: Color(0xff333333), fontSize: 18),
                ),
                SizedBox(height: 15.0),
                input
                    ? ConstrainedBox(
                        constraints: BoxConstraints(maxHeight: 35.0),
                        child: TextField(
                          controller: controller,
                          maxLines: 1,
                          autofocus: false,
                          textAlign: TextAlign.center,
                          autocorrect: false,
                          obscureText: false,
                          keyboardType: TextInputType.text,
                          style: TextStyle(
                            color: Color(0xff999999),
                            fontSize: hintTextSize,
                            textBaseline: TextBaseline.ideographic,
                          ),
                          onTap: onTap,
                          inputFormatters: <TextInputFormatter>[
                            LengthLimitingTextInputFormatter(length),
                          ],
                          decoration: InputDecoration(
                            fillColor: Color(0xfff6f7f9),
                            filled: true,
                            hintText: '请输入新增类别名称',
                            hintStyle: TextStyle(
                              color: Color(0xff999999),
                              fontSize: hintTextSize,
                            ),
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      )
                    : null,
              ],
            ),
          ),
          actions: <Widget>[
            new FlatButton(
              color: Color(0xffF0F0F0),
              padding: EdgeInsets.symmetric(vertical: 13.5),
              child: new Text('$cancelBtn', style: _style(Color(0xff333333))),
              onPressed: () {
                Navigator.pop(context);
                callBack(false);
              },
            ),
            new FlatButton(
              color: Color(0xffe1b96b),
              padding: EdgeInsets.symmetric(vertical: 13.5),
              child: new Text('$okBtn', style: _style(Colors.white)),
              onPressed: () {
                input
                    ? Navigator.of(context).pop(controller.text)
                    : Navigator.pop(context);
                callBack(true);
              },
            ),
          ],
        ),
      );
    },
  );
}
