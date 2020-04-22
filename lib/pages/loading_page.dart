import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: FlutterLogo(
            colors: Theme.of(context).primaryColor,
            size: 120.0,
          ),
        ),
      ),
    );
  }
}
