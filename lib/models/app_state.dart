import 'package:meta/meta.dart';
import 'package:flutter_basic/models/auth_state.dart';

@immutable
class AppState {

  final AuthState authState;

  AppState({AuthState authState}):
  this.authState = authState??new AuthState();

  static AppState fromJson(dynamic json) => new AppState(
    authState: new AuthState.fromJson(json['authState']==null ? Map():json['authState'])
  );

  //toJson名字固定
  Map<String,dynamic> toJson() => {
    'authState':authState.toJson()
  };


}