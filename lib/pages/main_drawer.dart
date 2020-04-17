import 'package:flutter/material.dart';
import 'package:flutter_basic/actions/auth_actions.dart';
import 'package:flutter_basic/models/app_state.dart';
import 'package:flutter_basic/styles/colors.dart';
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
                    color:  colorStyles['primary_dark'],
                  ),
                  child: UserAccountsDrawerHeader(
                    accountEmail: Text('cj_286@163.com'),
                    accountName: Text('cj'),
                    onDetailsPressed: () {},
                    currentAccountPicture: CircleAvatar(
                      child: FlutterLogo(
                        colors: colorStyles['primary'],
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
              icon: Icon(Icons.info),
              aboutBoxChildren: <Widget>[
                new Text("1.xxx"),
                new Text("2.xxx")
              ]
            ),
            Divider(),
            ListTile(
              title: Text('Sign Out'),
              leading: Icon(Icons.exit_to_app),
              onTap: ()=>logout(context),
            )
          ],
        ),
      ),
    );
  }
}
