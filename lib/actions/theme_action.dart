import 'package:flutter/material.dart';
import 'package:flutter_basic/models/app_state.dart';
import 'package:redux/redux.dart';

class ThemeColorAction{
  MaterialColor color;

  ThemeColorAction({this.color});
}

Function changeThemeColor = (MaterialColor color){
  return (Store<AppState> store){
    store.dispatch(ThemeColorAction(color: color));
  };
};