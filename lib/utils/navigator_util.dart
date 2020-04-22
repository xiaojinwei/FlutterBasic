import 'package:flutter/material.dart';

class NavigatorUtil {

  ///跳转到指定页面
  static push(BuildContext context, Widget page) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => page));
  }

  ///页面关闭
  static pop(BuildContext context){
    Navigator.pop(context);
  }
}