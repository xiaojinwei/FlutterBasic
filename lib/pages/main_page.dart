import 'package:flutter/material.dart';
import 'package:flutter_basic/navigator/tab_navigator.dart';

class MainPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _MainPageState();
  }
}

class _MainPageState extends State<MainPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TabNavigator(),
      ),
    );
  }

}