import 'package:flutter/material.dart';
import 'package:flutter_todo_app/field_controller.dart';

class FieldButton extends StatefulWidget {

  var value;
  var buttonIndex;
  FieldController controller;
  bool showText = true;
  bool removedButton = false;

  FieldButton(var buttonIndex, value,FieldController controller){
    this.buttonIndex = buttonIndex;
    this.controller = controller;
    this.value = value;
  }

  void toggleShowText(){
    showText = !showText;
  }

  void closeText(){
    showText = true;
  }

  String getValue(){
    return this.value;
  }

  @override
  FieldButtonState createState() => new FieldButtonState();
}
class FieldButtonState extends State<FieldButton> {

  void switchText(){
    setState((){
      widget.controller.checkForOpenButtons();
      widget.toggleShowText();
      widget.controller.openButton(this);
      widget.controller.checkForMatch();
    });
  }

  void toggleShowText(){
    setState((){
      widget.toggleShowText();
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return widget.removedButton ? new Container(height: 100.0) : new MaterialButton(
        height: 100.0,
        color: widget.showText ? Colors.blueGrey : Colors.amberAccent,
        child: widget.showText ? new Text("") : new Text(widget.value.toString()),
        onPressed: switchText
    );
  }

  void removeButton() {
    setState((){
      widget.removedButton = true;
    });
  }
}