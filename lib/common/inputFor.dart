import 'package:flutter/services.dart';

List<TextInputFormatter> formatNum = [
  WhitelistingTextInputFormatter(new RegExp(r'[0-9]'))
];

List<TextInputFormatter> formatNumAdd = [
  WhitelistingTextInputFormatter(new RegExp(r'[0-9.]'))
];

List<TextInputFormatter> testFormat = [
  new WhitelistingTextInputFormatter(RegExp(r'[0-9¬]'))
];

/// 价格
List<TextInputFormatter> priceFormat = [
  new WhitelistingTextInputFormatter(RegExp(r'^\d*\.{0,2}\d{0,2}'))
];

///不允许中文
List<TextInputFormatter> notWord = [
  BlacklistingTextInputFormatter(
    new RegExp(r"[^\x00-\xff]"),
  )
];
