import 'package:flutter/material.dart';
import 'package:flutter_basic/redux/models/app_state.dart';
import 'package:flutter_basic/ui/pages/font_page.dart';
import 'package:flutter_basic/ui/pages/language_page.dart';
import 'package:flutter_basic/ui/pages/theme_page.dart';
import 'package:flutter_basic/utils/i18n_util.dart';
import 'package:flutter_basic/utils/navigator_util.dart';
import 'package:flutter_basic/utils/theme_util.dart';
import 'package:flutter_redux/flutter_redux.dart';

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(I18nUtil.getS(context).setting),
        centerTitle: true,
      ),
      body: StoreBuilder<AppState>(
        builder: (context,store){
          return ListView(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.color_lens,color: Theme.of(context).primaryColor),
                title: Text(I18nUtil.getS(context).theme),
                onTap: ()=>NavigatorUtil.push(context, ThemePage()),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(5.0),
                      width: 24.0,
                      height: 24.0,
                      color: Theme.of(context).primaryColor,
                    ),
                    Icon(Icons.keyboard_arrow_right)
                  ],
                ),
              ),
              ListTile(
                leading: Icon(Icons.translate,color: Theme.of(context).primaryColor),
                title: Text(I18nUtil.getS(context).font),
                onTap: ()=>NavigatorUtil.push(context, FontPage()),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(ThemeUtil.getFontFamily(context),
                      style: TextStyle(fontSize: 14,color: Theme.of(context).primaryColor),),
                    Icon(Icons.keyboard_arrow_right)
                  ],
                ),
              ),
              ListTile(
                leading: Icon(Icons.language,color: Theme.of(context).primaryColor,),
                title: Text(I18nUtil.getS(context).multi_language),
                onTap: ()=>NavigatorUtil.push(context, LanguagePage()),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(I18nUtil.getSelectedLanguageModel(context)?.title,
                      style: TextStyle(fontSize: 14,color: Theme.of(context).primaryColor),),
                    Icon(Icons.keyboard_arrow_right)
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
