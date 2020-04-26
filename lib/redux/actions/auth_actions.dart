import 'package:flutter/material.dart';
import 'package:flutter_basic/redux/models/user.dart';
import 'package:redux/redux.dart';
import 'package:flutter_basic/redux/models/app_state.dart';

class UserLoginRequest {}

class UserLoginSuccess {
  User user;

  UserLoginSuccess(this.user);
}

class UserLoginFailure {
  String error;

  UserLoginFailure({this.error});
}

class UserLogout{}

final Function login = (BuildContext context,String username,String password){
  return (Store<AppState> store){
    store.dispatch(new UserLoginRequest());
    if('admin' == username && 'admin' == password){
      store.dispatch(new UserLoginSuccess(new User(token:'token__token',id:'id__id')));
      Navigator.of(context).pushNamedAndRemoveUntil('/main', (route) => false);
    }else{
      store.dispatch(new UserLoginFailure(error:'error__error'));
    }
  };
};

final Function logout = (BuildContext context){
  return (Store<AppState> store){
    store.dispatch(new UserLogout());
    Navigator.of(context).pushNamedAndRemoveUntil('/login', (route) => false);
  };
};