import 'package:flutter/material.dart';

class TextOutput extends StatelessWidget {
  
  String myText;
  TextOutput(this.myText);

  @override
  Widget build(BuildContext context) {
    return Text(myText);
  }
}