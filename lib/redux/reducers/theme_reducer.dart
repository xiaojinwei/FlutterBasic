
import 'package:flutter_basic/redux/actions/theme_action.dart';
import 'package:flutter_basic/redux/models/theme_state.dart';
import 'package:redux/redux.dart';

Reducer<ThemeState> themeReducer = combineReducers([
  new TypedReducer<ThemeState,ThemeColorAction>(changeThemeReducer),
  new TypedReducer<ThemeState,FontFamilyAction>(changeFontFamilyReducer),
]);

ThemeState changeThemeReducer(ThemeState themeState,ThemeColorAction action){
  return themeState.copyWith(
    themeColor: action.color
  );
}

ThemeState changeFontFamilyReducer(ThemeState themeState,FontFamilyAction action){
  return themeState.copyWith(
    fontFamily: action.fontFamily
  );
}