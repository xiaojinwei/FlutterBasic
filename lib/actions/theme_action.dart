import 'package:flutter/material.dart';
import 'package:flutter_basic/models/app_state.dart';
import 'package:redux/redux.dart';

class ThemeColorAction{
  MaterialColor color;

  ThemeColorAction({this.color});
}

class FontFamilyAction{
  String fontFamily;

  FontFamilyAction({this.fontFamily});
}

Function changeThemeColor = (MaterialColor color){
  return (Store<AppState> store){
    store.dispatch(ThemeColorAction(color: color));
  };
};

Function changeFontFamily = (String fontFamily){
  return (Store<AppState> store){
    store.dispatch(FontFamilyAction(fontFamily: fontFamily));
  };
};