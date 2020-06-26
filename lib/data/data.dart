import 'dart:convert' show jsonDecode;
import 'dart:io';

//import 'package:total/api/login_model.dart';
import 'package:total/data/actions.dart';
export 'package:total/data/actions.dart';
import 'package:total/data/store.dart';
import 'package:total/util/tools.dart';
export 'package:total/data/store.dart';

export 'notice.dart';


typedef Finish();

class JHData {
  static initStore({Finish finish}) {
    Store(JHActions.isLogin()).value = false;

    Store(JHActions.isSensitive()).value = Platform.isAndroid ? true : false;

    getStoreValue(JHActions.token()).then((v) {
      Store(JHActions.token()).value = v;
      String str = strNoEmpty(JHData.token())
          ? JHData.token()
          : ' status :is not login yet';
      print('user.token => $str');
    });
    getStoreValue(JHActions.loginResult()).then((onValue) {
      if (strNoEmpty(onValue)) {
        Map data = jsonDecode(onValue);
//        UserInfoModel model = UserInfoModel.fromJson(data['data']);
//        Store(JHActions.isLogin()).value = true;
//        Store(JHActions.avatar()).value = model.avatar;
//        Store(JHActions.id()).value = model.id;
//        Store(JHActions.inviteCode()).value = model.inviteCode;
//        Store(JHActions.loginPassword()).value = model.loginPassword;
//        Store(JHActions.mobile()).value = model.mobile;
//        Store(JHActions.nickName()).value = model.nickName;
//        Store(JHActions.sex()).value = model.sex;
        if (finish != null) {
          finish();
        }
      }
    });
  }

  static clean() {
    storeString(JHActions.token(), '');
    storeString(JHActions.loginResult(), '');
    Store(JHActions.isLogin()).value = false;
    Notice.send(JHActions.toTabBarIndex(), 0);
  }

  static String id() => Store(JHActions.id()).value;

  static String token() => Store(JHActions.token()).value ?? '';

  static String avatar() => Store(JHActions.avatar()).value;

  static bool isLogin() => Store(JHActions.isLogin()).value ?? false;

  static bool isMockLogin() => Store(JHActions.isMockLogin()).value ?? false;

  static String inviteCode() => Store(JHActions.inviteCode()).value ?? '111111';

  static String nickName() => Store(JHActions.nickName()).value ?? '';

  static String mobile() => Store(JHActions.mobile()).value ?? '';

  static String appVersion() => Store(JHActions.appVersion()).value ?? '';

  static bool isSensitive() =>
      Platform.isAndroid ? true : Store(JHActions.isSensitive()).value ?? false;
}
