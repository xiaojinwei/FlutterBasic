import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basic/presentation/platform_adaptive.dart';
import 'package:flutter_basic/store/store.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_basic/models/app_state.dart';
import 'package:redux/redux.dart';
import 'package:redux_persist_flutter/redux_persist_flutter.dart';
import 'package:flutter_basic/middleware/middleware.dart';
import 'package:flutter_basic/pages/main_page.dart';
import 'package:flutter_basic/pages/login_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final store = createStore();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return PersistorGate(
      persistor: persistor,
      builder: (context) => new StoreProvider(store: store, child: MaterialApp(
        title: 'Flutter Basic', //在安卓任务管理列表中显示的名称
        theme: defaultTargetPlatform == TargetPlatform.iOS
            ? kIOSTheme
            : kDefaultTheme,
        routes: <String,WidgetBuilder>{
          '/':(BuildContext context) => new StoreConnector<AppState,dynamic>(
            builder: (BuildContext context,dynamic isAuthenticated) => isAuthenticated ? new MainPage() : new LoginPage(),
            converter: (Store<AppState> store) => store.state.authState.isAuthenticated??false,
          ),
          '/main':(BuildContext context) => MainPage(),
          '/login':(BuildContext context) => LoginPage(),
        },
      )),
    );
  }
}

