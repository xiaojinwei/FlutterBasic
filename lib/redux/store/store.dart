import 'package:redux/redux.dart';
import 'package:flutter_basic/redux/reducers/app_reducer.dart';
import 'package:flutter_basic/redux/models/app_state.dart';
import 'package:flutter_basic/redux/middleware/middleware.dart';

Store<AppState> createStore(){
  Store<AppState> store = new Store(
    appReducer,
    initialState: new AppState(),
    middleware: createMiddleware()
  );
  persistor.start(store);

  return store;
}