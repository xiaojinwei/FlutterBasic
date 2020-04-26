import 'package:flutter/material.dart';
import 'package:flutter_basic/ui/pages/loading_page.dart';
import 'package:flutter_basic/redux/store/store.dart';
import 'package:flutter_basic/utils/i18n_util.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_basic/redux/models/app_state.dart';
import 'package:redux/redux.dart';
import 'package:redux_persist_flutter/redux_persist_flutter.dart';
import 'package:flutter_basic/redux/middleware/middleware.dart';
import 'package:flutter_basic/ui/pages/main_page.dart';
import 'package:flutter_basic/ui/pages/login_page.dart';
import 'package:flutter_basic/generated/i18n.dart';

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
      loading: LoadingPage(),
      builder: (context) => new StoreProvider(store: store, child: StoreBuilder<AppState>(//国际化必须要用StoreBuilder包裹一下
        builder: (context,store){
          return MaterialApp(
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate
            ],
            supportedLocales: S.delegate.supportedLocales,
            localeResolutionCallback: I18nUtil.localeResolutionCallback(),
            locale: store.state.locale,//如果locale设置为null或者不指定，那么会跟随系统的Locale从supportedLocales中找是否支持，不支持可以使用localeResolutionCallback来指定支持的Locale
            title: 'Flutter Basic', //在安卓任务管理列表中显示的名称
            theme: ThemeData(
              primarySwatch: store.state.themeState.themeColor,
              accentColor: store.state.themeState.themeColor,
              fontFamily: store.state.themeState.fontFamily,
            ),
            routes: <String,WidgetBuilder>{
              '/':(BuildContext context) => new StoreConnector<AppState,dynamic>(
                builder: (BuildContext context,dynamic isAuthenticated) =>
                isAuthenticated ? MainPage() : LoginPage(),
                converter: (Store<AppState> store) => store.state.authState.isAuthenticated??false,
              ),
              '/main':(BuildContext context) => MainPage(),
              '/login':(BuildContext context) => LoginPage(),
            },
          );
        },
      )),
    );
  }
}
