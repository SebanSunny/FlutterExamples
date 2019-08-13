import 'package:flutter/material.dart';

import './text-control.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  String _myText = 'This is the old sentence!';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Simple Stateful Widget'),
        ),
        body: TextControl()
      )
    );
  }
}
