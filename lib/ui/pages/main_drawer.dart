import 'package:flutter/material.dart';
import 'package:flutter_basic/redux/actions/auth_actions.dart';
import 'package:flutter_basic/redux/models/app_state.dart';
import 'package:flutter_basic/ui/pages/setting_page.dart';
import 'package:flutter_basic/utils/i18n_util.dart';
import 'package:flutter_basic/utils/navigator_util.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:package_info/package_info.dart';

class MainDrawer extends StatefulWidget {
  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  static var _packageInfo = PackageInfo();
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState,dynamic>(
      converter: (store) => (BuildContext context){store.dispatch(logout(context));},
      builder: (context,logout) => Drawer(
        child: ListView(
          padding: EdgeInsets.zero,//去除Drawer灰色头部
          children: <Widget>[
            Container(
              child: DrawerHeader(
                padding: EdgeInsets.all(0),
                  decoration: new BoxDecoration(
                    color: Theme.of(context).primaryColor,
                  ),
                  child: UserAccountsDrawerHeader(
                    accountEmail: Text('cj_286@163.com'),
                    accountName: Text('cj'),
                    onDetailsPressed: () {},
                    currentAccountPicture: CircleAvatar(
                      child: FlutterLogo(
                        colors: Theme.of(context).primaryColor,
                        size: 54.0,
                      ),
                    ),
                  )
              ),
            ),
            AboutListTile(
              applicationName: _packageInfo.appName,
              applicationLegalese: 'Copyright © cj',
              applicationVersion: _packageInfo.version,
              applicationIcon: Icon(Icons.info),
              icon: Icon(Icons.info,color: Theme.of(context).primaryColor,),
              aboutBoxChildren: <Widget>[
                new Text("1.xxx"),
                new Text("2.xxx")
              ]
            ),
            ListTile(
              title: Text(I18nUtil.getS(context).setting),
              leading: Icon(Icons.settings,color: Theme.of(context).primaryColor),
              onTap: (){
                NavigatorUtil.pop(context);
                NavigatorUtil.push(context, SettingPage());
              },
            ),
            Divider(),
            ListTile(
              title: Text(I18nUtil.getS(context).log_out),
              leading: Icon(Icons.exit_to_app,color: Theme.of(context).primaryColor),
              onTap: ()=>logout(context),
            )
          ],
        ),
      ),
    );
  }
}
