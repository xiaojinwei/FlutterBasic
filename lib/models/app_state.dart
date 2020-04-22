import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:flutter_basic/models/auth_state.dart';
import 'package:flutter_basic/extension/locale_ext.dart';

@immutable
class AppState {

  final AuthState authState;

  /*
   * 国际化
   *
   * 设置为null，就相当于auto跟随系统，
   * 将locale持久化，让切换语言在关闭应用时也能生效
   *
   * 如果MaterialApp.locale设置为null或者不指定，
   * 那么会跟随系统的Locale从supportedLocales中找是否支持，
   * 不支持可以使用localeResolutionCallback来指定支持的Locale
   */
  final Locale locale;

  AppState({AuthState authState,Locale locale}):
  this.authState = authState??new AuthState(),this.locale = locale;

  static AppState fromJson(dynamic json) => new AppState(
    authState: new AuthState.fromJson(json['authState']==null ? Map():json['authState']),
    locale: LocaleExtension.fromJson(json['locale'])
  );

  //toJson名字固定
  Map<String,dynamic> toJson() => {
    'authState':authState.toJson(),
    'locale':locale == null ? null : locale.toJson()
  };

  @override
  String toString() {
    return '''AppState{
            authState: $authState,
            locale: $locale,
        }''';
  }

}