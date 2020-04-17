import 'package:redux_persist/redux_persist.dart';
import 'package:flutter_basic/models/app_state.dart';
import 'package:flutter_basic/reducers/auth_reducer.dart';

AppState appReducer(AppState state,action){
  if(action is PersistLoadedAction<AppState>){
    return action.state??state;
  }else{
    return new AppState(
      authState:authReducer(state.authState,action)
    );
  }
}