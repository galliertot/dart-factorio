import 'dart:math';

import 'lib.dart';

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
      map += element.icon;
    });
    map +=
        "\n\n Vide ⚪ | Usine 🔥 | Forêt 🌳 |  Maison 🏡 | Mine ⛏ |  Scierie 🔪 \n\n\n";
    print(map);
  }

  void replaceOnMap(int x, int y, BaseObject object) {
    Game().map[(x * 10) + (y)] = object;
  }
}
