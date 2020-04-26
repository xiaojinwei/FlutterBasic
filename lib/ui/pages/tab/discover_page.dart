import 'package:flutter/material.dart';

class DiscoverPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _DiscoverPageState();
  }
}

class _DiscoverPageState extends State<DiscoverPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('discover'),
      ),
    );
  }

}