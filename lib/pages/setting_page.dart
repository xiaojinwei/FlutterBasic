import 'package:flutter/material.dart';
import 'package:flutter_basic/pages/language_page.dart';
import 'package:flutter_basic/utils/i18n_util.dart';
import 'package:flutter_basic/utils/navigator_util.dart';

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(I18nUtil.getS(context).setting),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.language),
            title: Text(I18nUtil.getS(context).multi_language),
            onTap: ()=>NavigatorUtil.push(context, LanguagePage()),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(I18nUtil.getSelectedLanguageModel(context)?.title,
                  style: TextStyle(fontSize: 14,color: Colors.grey),),
                Icon(Icons.keyboard_arrow_right)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
