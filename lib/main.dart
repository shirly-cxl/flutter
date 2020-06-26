import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:total/app.dart';
import 'dart:io';
import 'package:total/util/tools.dart';

void main() {
  /// 确保初始化
  WidgetsFlutterBinding.ensureInitialized();

  /// 初始化数据
  JHData.initStore();

  /// 是否模拟登录（写死Token）
  Store(JHActions.isMockLogin()).value = true;
  /// app入口
  runApp(MyApp());
  /// 沉浸式状态栏
  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle =
    SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }

  /// 自定义红屏页
  ErrorWidget.builder = (FlutterErrorDetails flutterErrorDetails) {
    debugPrint("flutterErrorDetails::" + flutterErrorDetails.toString());
    return new Center(child: new Text("网络开小差了"));
  };
}

////ctrl+f  查找
////面试题：https://github.com/ahyangnb/flutter_interview
//
//
////printDailyNewsDigest()async{
////  String news =await gatherNewsReports();
////  print(news);
////}
////Future gatherNewsReports(){
////  return Future.value('2');
////}
////printWinningLotteryNumbers(){
////  print('3');
////}
////printWeatherForecast(){
////  print('1');
////}
////printBaseballScore(){
////  print('7');
////}
////
////main(){
////  printDailyNewsDigest();
////  printWinningLotteryNumbers();
////  printWeatherForecast();
////  printBaseballScore();
////}
////结果：3   1   7   2
