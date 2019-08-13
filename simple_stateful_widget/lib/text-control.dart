import 'package:flutter/material.dart';
import './text-output.dart';

class TextControl extends StatefulWidget {
  
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TextControlState();
  }
}

class _TextControlState extends State<TextControl> {
  String _myText = 'This is the old sentence!';

  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            TextOutput(_myText),
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
    );
  }
}