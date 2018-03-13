import 'package:flutter/material.dart';
import 'package:flutter_todo_app/field_button.dart';
import 'package:flutter_todo_app/field_controller.dart';
import 'package:flutter_todo_app/utils.dart';

void main() => runApp(new GuessingGame());

class GuessingGame extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Guessing game',
      theme: new ThemeData(
          primaryColor: Colors.amberAccent
      ),
      home: new MyHomePage(title: 'Guessing game Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;
  final FieldController controller = new FieldController();

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Map<int,FieldButton> buttonsMap = new Map();

  @override
  Widget build(BuildContext context) {

    var fieldSize = {
      'width': 4,
      'height': 4
    };

    var buttonArrays = [];
    var buttonIndex = 1;

    var buttonValues = generateFieldValues(fieldSize);

    for (var i = 0; i < fieldSize['width']; i++) {

      var columnButtons = [];
      for (var j = 0; j < fieldSize['height']; j++) {

        var buttonValue = buttonValues[buttonIndex-1];
        FieldButton b = new FieldButton(buttonIndex, buttonValue, widget.controller);
        buttonsMap[buttonIndex] = b;
        columnButtons.add(b);
        buttonIndex++;
      }
      Column c = new Column(
          children: columnButtons,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      );
      buttonArrays.add(c);
    };

    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),

      body: new Center(
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: buttonArrays,
        ),
      ),
    );
  }
}
