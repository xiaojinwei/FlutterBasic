import 'package:flutter/material.dart';
import 'package:flutter_basic/extension/color_ext.dart';

class ThemeState {
  MaterialColor themeColor;
  
  ThemeState({MaterialColor themeColor}):this.themeColor = themeColor??Colors.purple;

  factory ThemeState.fromJson(Map<String,dynamic> json) => ThemeState(
    themeColor:ColorExtension.fromJson(json == null ? null : json['themeColor'])
  );

  Map<String,dynamic> toJson() => <String,dynamic>{
    'themeColor': themeColor == null ? null : themeColor.toJson()
  };

  ThemeState copyWith({
    Color themeColor
  }){
    return new ThemeState(
        themeColor: themeColor??this.themeColor
    );
  }

  @override
  String toString() {
    return '''ThemeState{
            themeColor: $themeColor,
        }''';
  }
}