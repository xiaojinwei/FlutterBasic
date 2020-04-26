
import 'dart:ui';

import 'package:flutter_basic/redux/actions/locale_action.dart';
import 'package:redux/redux.dart';

Reducer<Locale> localeReducer = combineReducers([
  new TypedReducer<Locale,LocaleAction>(changeLocaleReducer),
]);

Locale changeLocaleReducer(Locale locale,LocaleAction action){
  locale = action.locale;
  return locale;
}