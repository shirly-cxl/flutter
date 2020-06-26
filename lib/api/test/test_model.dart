import 'package:total/util/tools.dart';

/// **************************************************************************
/// 来自金慧科技Json转Dart工具
/// **************************************************************************

/*
* 重设密码的参数  -  重设密码
*
* @param firstPassword string 登陆密码，长度在8~20字符之间
* @param mobile string 手机号
* @param secondPassword string 确认密码
* */
class ResetPasswordRequestModel extends BaseRequest {
  final String firstPassword;
  final String mobile;
  final String secondPassword;

  ResetPasswordRequestModel({
    this.firstPassword,
    this.mobile,
    this.secondPassword,
  });

  @override
  String url() => '/user/password';

  @override
  Map<String, dynamic> toJson() {
    return {
      "firstPassword": this.firstPassword,
      "mobile": this.mobile,
      "secondPassword": this.secondPassword,
    };
  }
}

/// 最新任务
class NewMissionRequestModel extends BaseRequest {
  @override
  String url() => '/index/new-mission';
}

/// **************************************************************************
/// 来自金慧科技Json转Dart工具
/// **************************************************************************

/*
* [#/definitions/MissionsVO数据信息MissionsVO数据信息
*
* @param ask string 要价
* @param category string 业务类别
* @param categoryId string 业务类别Id
* @param content string 简介
* @param expirationTime string($date-time) 过期时间
* @param limit integer($int32) 时限
* @param own boolean 是否自己发布的
* @param status MissionsStatusEnum
* @param title string 标题]
* */
class TestResponseModel {
  final List<Data> data;

  TestResponseModel({
    this.data,
  });

  factory TestResponseModel.fromJson(Map<String, dynamic> json) =>
      _$TestResponseModelFromJson(json);

  TestResponseModel from(Map<String, dynamic> json) =>
      _$TestResponseModelFromJson(json);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

TestResponseModel _$TestResponseModelFromJson(Map<String, dynamic> json) {
  return TestResponseModel(
    data: List.from(json['data']).map((item) {
      return new Data().from(item);
    }).toList(),
  );
}

class Data {
  final String ask;
  final String category;
  final String categoryId;
  final String content;
  final String expirationTime;
  final int limit;
  final String own;
  final String title;

  Data({
    this.ask,
    this.category,
    this.categoryId,
    this.content,
    this.expirationTime,
    this.limit,
    this.own,
    this.title,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Data from(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ask'] = this.ask;
    data['category'] = this.category;
    data['categoryId'] = this.categoryId;
    data['content'] = this.content;
    data['expirationTime'] = this.expirationTime;
    data['limit'] = this.limit;
    data['own'] = this.own;
    data['title'] = this.title;
    return data;
  }
}

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
    ask: json['ask'],
    category: json['category'],
    categoryId: json['categoryId'],
    content: json['content'],
    expirationTime: json['expirationTime'],
    limit: json['limit'],
    own: json['own'],
    title: json['title'],
  );
}

/// 分页获取所有任务
class MissionListRequestModel extends BaseRequest {
  final int page;
  final int limit;

  MissionListRequestModel({
    this.page,
    this.limit,
  });

  @override
  String url() => '/mission/publishingPage/$page/$limit';
}

/// **************************************************************************
/// 来自金慧科技Json转Dart工具
/// **************************************************************************

/*
* [分页获取所有任务 Response
*
* @param ask string 要价
* @param category string 业务类别
* @param categoryId string 业务类别Id
* @param content string 简介
* @param expirationTime string($date-time) 过期时间
* @param limit integer($int32) 时限
* @param own boolean 是否自己发布的
* @param status MissionsStatusEnum
* @param title string 标题]
* */
class ListResponseModel {
  final String ask;
  final String category;
  final String categoryId;
  final String content;
  final int expirationTime;
  final int limit;
  final bool own;
  final String status;
  final String title;

  ListResponseModel({
    this.ask,
    this.category,
    this.categoryId,
    this.content,
    this.expirationTime,
    this.limit,
    this.own,
    this.status,
    this.title,
  });

  factory ListResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ListResponseModelFromJson(json);

  ListResponseModel from(Map<String, dynamic> json) =>
      _$ListResponseModelFromJson(json);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ask'] = this.ask;
    data['category'] = this.category;
    data['categoryId'] = this.categoryId;
    data['content'] = this.content;
    data['expirationTime'] = this.expirationTime;
    data['limit'] = this.limit;
    data['own'] = this.own;
    data['status'] = this.status;
    data['title'] = this.title;
    return data;
  }
}

ListResponseModel _$ListResponseModelFromJson(Map<String, dynamic> json) {
  return ListResponseModel(
    ask: json['ask'],
    category: json['category'],
    categoryId: json['categoryId'],
    content: json['content'],
    expirationTime: json['expirationTime'],
    limit: json['limit'],
    own: json['own'],
    status: json['status'],
//    status: json['status'] != null ? new Status.fromJson(json['status']) : null,
    title: json['title'],
  );
}

class Status {
  final int code;
  final String descp;

  Status({
    this.code,
    this.descp,
  });

  factory Status.fromJson(Map<String, dynamic> json) => _$StatusFromJson(json);

  Status from(Map<String, dynamic> json) => _$StatusFromJson(json);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['descp'] = this.descp;
    return data;
  }
}

Status _$StatusFromJson(Map<String, dynamic> json) {
  return Status(
    code: json['code'],
    descp: json['descp'],
  );
}
