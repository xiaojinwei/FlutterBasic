import 'package:flutter/material.dart';
import 'package:flutter_basic/actions/locale_action.dart';
import 'package:flutter_basic/models/app_state.dart';
import 'package:flutter_basic/styles/colors.dart';
import 'package:flutter_basic/utils/i18n_util.dart';
import 'package:flutter_redux/flutter_redux.dart';

class LanguagePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LanguagePageState();
}

class LanguagePageState extends State<LanguagePage>{

  List<LanguageModel> supports = [];

  @override
  Widget build(BuildContext context) {
      supports.clear();
      supports.addAll(I18nUtil.getSupportLanguagesSort(context));
      return Scaffold(
        appBar: AppBar(
          title: Text(I18nUtil.getS(context).multi_language),
        ),
        body: StoreConnector<AppState,dynamic>(
          converter: (store){
            return (Locale locale)=>store.dispatch(changeLocale(locale));
          },
          builder: (context,changeLocale){
            return ListView.builder(
              itemCount: supports.length,
              itemBuilder: (BuildContext context,int index){
                LanguageModel model = supports[index];
                return ListTile(
                  title: Text(model?.title),
                  onTap: ()=>switchLanguage(model.locale,changeLocale),
                  trailing: new Radio(
                      value: true,
                      groupValue: model.isSelected == true,
                      activeColor: colorStyles['primary'],
                      onChanged: (value) {
                        switchLanguage(model.locale,changeLocale);
                      }),
                );
              },
            );
          },
        ),
      );
  }

  switchLanguage(Locale locale,changeLocale){
    setState(() {
      changeLocale(locale);
    });
  }

}
