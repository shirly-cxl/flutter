import 'package:flutter/material.dart';
import 'package:total/util/tools.dart';
import 'test_model.dart';

TestViewModel testViewModel = new TestViewModel();

class TestViewModel extends BaseViewModel {
  /// 重设密码的参数  -  重设密码
  Future<ResponseModel> resetPassword(
    BuildContext context, {
    String firstPassword,
    String mobile,
    String secondPassword,
  }) async {
    ResponseModel data = await ResetPasswordRequestModel(
      firstPassword: firstPassword,
      mobile: mobile,
      secondPassword: secondPassword,
    )
        .sendApiAction(
      context,
      reqType: ReqType.put,
      hud: '修改中',
    )
        .then((rep) {
      showToast(context, '修改密码成功');
      return ResponseModel.fromSuccess(rep);
    }).catchError((e) {
      throw ResponseModel.fromError(e.message, e.code);
    });
    return data;
  }

  /// 最新任务
  Future<ResponseModel> newMission(
    BuildContext context,
  ) async {
    ResponseModel data = await NewMissionRequestModel()
        .sendApiAction(
      context,
      reqType: ReqType.get,
      hud: '请求中',
    )
        .then((rep) {
      TestResponseModel model = TestResponseModel.fromJson(rep);
      return ResponseModel.fromSuccess(model.data);
    }).catchError((e) {
      throw ResponseModel.fromError(e.message, e.code);
    });
    return data;
  }

  /// 分页获取所有任务
  Future<ResponseModel> missionList(
    BuildContext context, {
    int page,
    int limit,
  }) async {
    ResponseModel data = await MissionListRequestModel(
      page: page,
      limit: limit,
    )
        .sendApiAction(
      context,
      reqType: ReqType.get,
      hud: '请求中',
    )
        .then((rep) {
      List data = dataModelListFromJson(
          rep['data']['records'], new ListResponseModel());
      if (!listNoEmpty(data)) {
        throw ResponseModel.fromError('没有更多数据了', rep['code']);
      }
      return ResponseModel.fromSuccess(data);
    }).catchError((e) {
      throw ResponseModel.fromError(e.message, e.code);
    });
    return data;
  }
}
