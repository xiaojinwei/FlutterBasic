
import 'dart:ui';

import 'package:flutter_basic/actions/locale_action.dart';
import 'package:flutter_basic/actions/theme_action.dart';
import 'package:flutter_basic/models/theme_state.dart';
import 'package:redux/redux.dart';

Reducer<ThemeState> themeReducer = combineReducers([
  new TypedReducer<ThemeState,ThemeColorAction>(changeThemeReducer),
]);

ThemeState changeThemeReducer(ThemeState themeState,ThemeColorAction action){
  return themeState.copyWith(
    themeColor: action.color
  );
}