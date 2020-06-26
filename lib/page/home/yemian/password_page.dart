import 'package:flutter/material.dart';
import 'package:total/widget/input_password_diy/number_key_board.dart';
import 'package:total/widget/input_password_diy/password_input_widget.dart';
import 'package:total/widget/input_password_diy/password_keyboard.dart';

//支付密码
class PassWordPage extends StatefulWidget {
  @override
  _PassWordPageState createState() => _PassWordPageState();
}

class _PassWordPageState extends State<PassWordPage> {
  ///支付密码键盘弹出时padding的改变
  bool checkPadding = false;

  ///支付方式的判断
  bool chose = false;

  /// 用户输入的密码
  String pwdData = '';
  /*
    GlobalKey：整个应用程序中唯一的键
    ScaffoldState：Scaffold框架的状态
    解释：_scaffoldKey的值是Scaffold框架状态的唯一键
   */
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // VoidCallback：没有参数并且不返回数据的回调
  VoidCallback _showBottomSheetCallback;

  @override
  void initState() {
    super.initState();
    _showBottomSheetCallback = _showBottomSheet;
    WidgetsBinding.instance.addPostFrameCallback((v) {
      checkPadding = true;
      if (_showBottomSheetCallback != null) _showBottomSheetCallback();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      body: SafeArea(
        child: _buildContent(context),
      ),
    );
  }

  Widget _buildContent(BuildContext c) {
    return Stack(
      children: <Widget>[
        Container(
          width: 375,
          height: 667,
          color: Colors.transparent,
        ),
        Padding(
          padding: EdgeInsets.only(
            top: checkPadding ? 65 : MediaQuery.of(context).size.height / 4,
          ),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 32),
            height: 240,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Color(0xff5A5A5A),
            ),
            child: Column(
              children: <Widget>[
                //标题
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Container(
                    margin: EdgeInsets.only(left: 17, right: 17),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        InkWell(
                          child: Icon(
                              Icons.cancel,color: Colors.amber,
                          ),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                        Spacer(),
                        Text(
                          '请输入支付密码',
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xFFE1B96B),
                          ),
                        ),
                        Spacer()
                      ],
                    ),
                  ),
                ),
                ///密码框
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: _buildPwd(pwdData),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  /// 密码键盘 确认按钮 事件
//  void onAffirmButton() {}

  /// 密码键盘的整体回调，根据不同的按钮事件来进行相应的逻辑实现
  void _onKeyDown(KeyEvent data) {
// 如果点击了删除按钮，则将密码进行修改
    if (data.isDelete()) {
      if (pwdData.length == 0) {
        return;
      } else if (pwdData.length > 0) {
        pwdData = pwdData.substring(0, pwdData.length - 1);
        setState(() {});
      }
    }
// 点击了确定按钮时
    else if (data.isCommit()) {
      if (pwdData.length != 6) {
//        Fluttertoast.showToast(msg: "密码不足6位，请重试", gravity: ToastGravity.CENTER);
        return;
      }
//      onAffirmButton();
    }
//点击了数字按钮时  将密码进行完整的拼接
    else {
      if (pwdData.length >= 6) {
        handle();
      } else if (pwdData.length < 6) {
        pwdData += data.key;

        if (pwdData.length >= 6) {
          handle();
//        Navigator.of(context).pushAndRemoveUntil(
//            MaterialPageRoute(builder: (context) {
//          return MineChongzhi_Second(
//            money: widget.money,
//          );
//        }), (route) => route == null);
//
//        Navigator.pop(context);
//        Navigator.push(context, MaterialPageRoute(builder: (_) {
//          return MineChongzhi_Second(
//            money: widget.money,
//          );
//        }));
        }
      }
      setState(() {});
    }
  }

  void handle() {
  }

  /// 底部弹出 自定义键盘  下滑消失
  void _showBottomSheet() {
    setState(() {
      // disable the button  // 禁用按钮
      _showBottomSheetCallback = null;
    });

    /*
      currentState：获取具有此全局键的树中的控件状态
      showBottomSheet：显示持久性的质感设计底部面板
      解释：联系上文，_scaffoldKey是Scaffold框架状态的唯一键，因此代码大意为，
           在Scaffold框架中显示持久性的质感设计底部面板
     */
    _scaffoldKey.currentState
        .showBottomSheet<void>((BuildContext context) {
      /// 将自定义的密码键盘作为其child   这里将回调函数传入
      return PassWordKeyboard(_onKeyDown);
    })
        .closed
        .whenComplete(() {
      if (mounted) {
        setState(() {
          checkPadding = false;
          // re-enable the button  // 重新启用按钮
          _showBottomSheetCallback = _showBottomSheet;
        });
      }
    });
  }

  /// 构建 密码输入框  定义了其宽度和高度
  Widget _buildPwd(var pwd) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16),
        width: MediaQuery.of(context).size.width,
        height: 44,
        color: Color(0xFFF3F3F3),
        child: PasswordInputWidget(pwd),
      ),
// 用户点击输入框的时候，弹出自定义的键盘
      onTap: () {
        checkPadding = true;
        if (_showBottomSheetCallback != null) _showBottomSheetCallback();
        print('pwd:$pwd');
      },
    );
  }
}

/// 自定义密码 键盘

class PassWordKeyboard extends StatefulWidget {
  final callback;

  PassWordKeyboard(this.callback);

  @override
  State<StatefulWidget> createState() {
    return new MyKeyboardStat();
  }
}

class MyKeyboardStat extends State<PassWordKeyboard> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  /// 定义 确定 按钮 接口  暴露给调用方
  ///回调函数执行体
  var backMethod;

  void onCommitChange() {
    widget.callback(new KeyEvent("commit"));
  }

  void onOneChange(BuildContext cont) {
    widget.callback(new KeyEvent("1"));
  }

  void onTwoChange(BuildContext cont) {
    widget.callback(new KeyEvent("2"));
  }

  void onThreeChange(BuildContext cont) {
    widget.callback(new KeyEvent("3"));
  }

  void onFourChange(BuildContext cont) {
    widget.callback(new KeyEvent("4"));
  }

  void onFiveChange(BuildContext cont) {
    widget.callback(new KeyEvent("5"));
  }

  void onSixChange(BuildContext cont) {
    widget.callback(new KeyEvent("6"));
  }

  void onSevenChange(BuildContext cont) {
    widget.callback(new KeyEvent("7"));
  }

  void onEightChange(BuildContext cont) {
    widget.callback(new KeyEvent("8"));
  }

  void onNineChange(BuildContext cont) {
    widget.callback(new KeyEvent("9"));
  }

  void onZeroChange(BuildContext cont) {
    widget.callback(new KeyEvent("0"));
  }

  /// 点击删除
  void onDeleteChange() {
    widget.callback(new KeyEvent("del"));
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      key: _scaffoldKey,
      width: MediaQuery.of(context).size.width,
      height: 200,
      color: Colors.white,
      child: new Column(
        children: <Widget>[
//          new Container(
//            height: 30.0,
//            color: Colors.white,
//            alignment: Alignment.center,
//            child: new Text(
//              '下滑隐藏',
//              style: new TextStyle(fontSize: 12.0, color: Color(0xff999999)),
//            ),
//          ),

          ///  键盘主体
          new Column(
            children: <Widget>[
              Container(
                height: 20,
                color: Color(0XFF5A5A5A),
              ),

              ///  第一行
              new Row(
                children: <Widget>[
                  NumberKeyBoardWidget(
                      text: '1',
                      letter: '',
                      callback: (val) => onOneChange(context)),
                  NumberKeyBoardWidget(
                      text: '2',
                      letter: 'ABC',
                      callback: (val) => onTwoChange(context)),
                  NumberKeyBoardWidget(
                      text: '3',
                      letter: 'DEF',
                      callback: (val) => onThreeChange(context)),
                  NumberKeyBoardWidget(
                      text: 'X',
                      letter: '',
                      callback: (val) => onDeleteChange()),
                ],
              ),

              ///  第二行
              Row(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      new Row(
                        children: <Widget>[
                          NumberKeyBoardWidget(
                              text: '4',
                              letter: 'GHI',
                              callback: (val) => onFourChange(context)),
                          NumberKeyBoardWidget(
                              text: '5',
                              letter: 'JKL',
                              callback: (val) => onFiveChange(context)),
                          NumberKeyBoardWidget(
                              text: '6',
                              letter: 'MNO',
                              callback: (val) => onSixChange(context)),
                        ],
                      ),
                      new Row(
                        children: <Widget>[
                          NumberKeyBoardWidget(
                              text: '7',
                              letter: 'PQRS',
                              callback: (val) => onSevenChange(context)),
                          NumberKeyBoardWidget(
                              text: '8',
                              letter: 'TUV',
                              callback: (val) => onEightChange(context)),
                          NumberKeyBoardWidget(
                              text: '9',
                              letter: 'WXYZ',
                              callback: (val) => onNineChange(context)),
                        ],
                      ),
                    ],
                  ),
                  NumberKeyBoardWidget1(
                      text: '0', callback: (val) => onZeroChange(context)),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

