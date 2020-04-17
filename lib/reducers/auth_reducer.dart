import 'package:redux/redux.dart';
import 'package:flutter_basic/models/auth_state.dart';
import 'package:flutter_basic/actions/auth_actions.dart';

Reducer<AuthState> authReducer = combineReducers([
  new TypedReducer<AuthState,UserLoginRequest>(userLoginRequestReducer),
  new TypedReducer<AuthState,UserLoginSuccess>(userLoginSuccessReducer),
  new TypedReducer<AuthState,UserLoginFailure>(userLoginFailureReducer),
  new TypedReducer<AuthState,UserLogout>(userLogoutReducer),
]);

AuthState userLoginRequestReducer(AuthState authState,UserLoginRequest request){
  return authState.copyWith(
    isAuthenticated: false,
    isAuthenticating: true
  );
}

AuthState userLoginSuccessReducer(AuthState authState,UserLoginSuccess success){
  return authState.copyWith(
      isAuthenticated: true,
      isAuthenticating: false
  );
}

AuthState userLoginFailureReducer(AuthState authState,UserLoginFailure failure){
  return authState.copyWith(
      isAuthenticated: false,
      isAuthenticating: false
  );
}

AuthState userLogoutReducer(AuthState auth, UserLogout action) {
  return new AuthState();
}