
import 'package:flutter/material.dart';
import 'package:flutter_basic/models/app_state.dart';
import 'package:flutter_redux/flutter_redux.dart';

class ThemeUtil{
  static Color getThemeColor(BuildContext context){
    return StoreProvider.of<AppState>(context).state.themeState.themeColor;
  }
}