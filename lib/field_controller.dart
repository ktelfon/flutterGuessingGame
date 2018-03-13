import 'package:flutter_todo_app/field_button.dart';

class FieldController {

  List<FieldButtonState> openButtons = [];

  FieldController(){

  }

  void checkForOpenButtons(){
    if(openButtons.length == 2) {
      closeAllOpenButtons();
    }
  }

  void checkForMatch(){
    if(openButtons.length == 2 && openButtons[0].widget.value == openButtons[1].widget.value){
      removeButtons();
    }
  }

  void openButton(FieldButtonState button){
    openButtons.add(button);
  }

  void closeAllOpenButtons(){
    for (var iter = openButtons.iterator; iter.moveNext();) {
      FieldButtonState number = iter.current;
      number.toggleShowText();
    }
    openButtons = [];
  }

  void removeButtons() {
    for (var iter = openButtons.iterator; iter.moveNext();) {
      FieldButtonState number = iter.current;
      number.removeButton();
    }
    openButtons = [];
  }
}