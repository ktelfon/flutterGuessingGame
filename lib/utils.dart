import 'dart:math';

List generateFieldValues(var fieldSize){
  var buttonValue = [];
  for(int i = 0 ; i < (fieldSize['width'] * fieldSize['height']) / 2; i++)
    buttonValue.add(i);

  var buttonValueSecondPart = [];
  buttonValueSecondPart.addAll(buttonValue);
  buttonValueSecondPart.addAll(buttonValue);

  shuffle(buttonValueSecondPart);
  return buttonValueSecondPart;
}

List shuffle(List items) {
  var random = new Random();

  // Go through all elements.
  for (var i = items.length - 1; i > 0; i--) {

    // Pick a pseudorandom number according to the list length
    var n = random.nextInt(i + 1);

    var temp = items[i];
    items[i] = items[n];
    items[n] = temp;
  }

  return items;
}