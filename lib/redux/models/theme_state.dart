import 'package:flutter/material.dart';
import 'package:flutter_basic/common/const.dart';
import 'package:flutter_basic/extension/color_ext.dart';

class ThemeState {
  MaterialColor themeColor;//主题
  String fontFamily;//字体
  
  ThemeState({MaterialColor themeColor,String fontFamily}):
        this.themeColor = themeColor??Colors.purple,this.fontFamily = fontFamily??Const.supportFontFamily[0];

  factory ThemeState.fromJson(Map<String,dynamic> json) => ThemeState(
      themeColor:ColorExtension.fromJson(json == null ? null : json['themeColor']),
      fontFamily:json == null ? null : json['fontFamily']
  );

  Map<String,dynamic> toJson() => <String,dynamic>{
    'themeColor': themeColor == null ? null : themeColor.toJson(),
    'fontFamily': fontFamily
  };

  ThemeState copyWith({
    MaterialColor themeColor,
    String fontFamily
  }){
    return new ThemeState(
        themeColor: themeColor??this.themeColor,
        fontFamily: fontFamily??this.fontFamily
    );
  }

  @override
  String toString() {
    return '''ThemeState{
            themeColor: $themeColor,
            fontFamily: $fontFamily,
        }''';
  }
}