import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  String _myText = 'This is the old sentence!';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Simple Stateful Widget'),
        ),
        body: Center(
          child: Container(
            margin: EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                Text(_myText),
                RaisedButton(
                  onPressed: () {
                    setState(() {
                      _myText = 'This is the new sentence!';
                    });
                  },
                  child: Text('Change Text'),
                )
              ],
            )
          )
        )
      )
    );
  }
}
