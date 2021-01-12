import 'dart:math';

import 'lib.dart';

enum Board_Element_Type { Mine, Factory, Forest, Sawmill, House, EmptyObject }

extension Icon on Board_Element_Type {
  String get icon {
    switch (this) {
      case Board_Element_Type.EmptyObject:
        return ' ⚪ ';
      case Board_Element_Type.House:
        return ' 🏡 ';
      case Board_Element_Type.Factory:
        return ' 🔥 ';
      case Board_Element_Type.Forest:
        return ' 🌳 ';
      case Board_Element_Type.Mine:
        return ' ⛏  ';
      case Board_Element_Type.Sawmill:
        return ' 🔪 ';
    }
    return '';
  }

  String get name {
    switch (this) {
      case Board_Element_Type.EmptyObject:
        return 'EmptyObject';
      case Board_Element_Type.House:
        return 'House';
      case Board_Element_Type.Factory:
        return 'Factory';
      case Board_Element_Type.Forest:
        return 'Forest';
      case Board_Element_Type.Mine:
        return 'Mine';
      case Board_Element_Type.Sawmill:
        return 'Sawmill';
    }
    return '';
  }
}

class Board {
  // Singleton
  static final Board _shared = Board._internal();
  factory Board() {
    return _shared;
  }
  Board._internal();

  void showMap() {
    String map = '  ';
    int lineNumber = 0;
    for (int i = 0; i < 10; i++) {
      map += "  ${i} ";
    }
    Game().map.forEach((element) {
      if (Game().map.indexOf(element) % 10 == 0) {
        map += "\n\n ${lineNumber} ";
        lineNumber += 1;
      }
      map += Board_Element_Type.values
          .firstWhere((type) => type.name == element.runtimeType.toString())
          .icon;
    });
    map += "\n\n\n";
    print(map);
  }
}
