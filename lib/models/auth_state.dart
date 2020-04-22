import 'package:flutter_basic/models/user.dart';

class AuthState {
  final bool isAuthenticated;
  final bool isAuthenticating;
  final User user;
  final String error;

  AuthState({this.isAuthenticated = false,this.isAuthenticating = false,
  this.user,this.error});

  factory AuthState.fromJson(Map<String,dynamic> json) => new AuthState(
    isAuthenticated: json['isAuthenticated']??false,
    isAuthenticating: json['isAuthenticating']??false,
    user: json['user'] == null ? null : User.fromJson(json['user']),
    error: json['error']??''
  );

  Map<String,dynamic> toJson() => <String,dynamic>{
    'isAuthenticated':this.isAuthenticated,
    'isAuthenticating':this.isAuthenticating,
    'user':this.user == null ? null : this.user.toJson(),
    'error':this.error
  };

  AuthState copyWith({
    bool isAuthenticated,
    bool isAuthenticating,
    User user,
    String error
  }){
    return new AuthState(
      isAuthenticating: isAuthenticating??this.isAuthenticating,
      isAuthenticated: isAuthenticated??this.isAuthenticated,
      user: user??this.user,
      error: error??this.error
    );
  }

  @override
  String toString() {
    return '''AuthState{
            isAuthenticated: $isAuthenticated,
            isAuthenticating: $isAuthenticating,
            user: $user,
            error: $error,
        }''';
  }

}