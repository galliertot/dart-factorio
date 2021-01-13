import 'dart:io';
import 'lib.dart';
import "dart:math";

abstract class UpdateGame {
  void update();
}

class Game {
  // Singleton
  static final Game _shared = Game._internal();
  factory Game() {
    return _shared;
  }
  Game._internal();

  // Running
  List<BaseObject> map;
  final updatables = <UpdateGame>[];

  BaseObject randomObject(int x, int y) {
    var list = [
      Forest(),
      Mine(),
      EmptyObject(),
      EmptyObject(),
      EmptyObject(),
      EmptyObject(),
      EmptyObject(),
      EmptyObject(),
      EmptyObject(),
      EmptyObject()
    ];
    var object = list[Random().nextInt(list.length)];
    object.x = x;
    object.y = y;
    return object;
  }

  void run() {
    print("Bienvenue dans le petit jeu de toto, entrer votre nom :");
    User().name = stdin.readLineSync();
    print("C'est parti ${User().name} ! \n\n\n");
    map = List.generate(
        100, (index) => randomObject(index % 10, (index / 10).toInt()));
    int turn = 1;
    while (true) {
      Board().showMap();
      User().gainRessource();
      print(User().toString());
      askAction(turn);
      turn += 1;
    }
  }

  void askAction(int turn) {
    print("Tour n°${turn}: que voulez-vous faire ?\n");
    print(
        "1 : Créer une usine (2 fers, 2 metals, 1 bois, 1 bronze) \n2 : Créer une maison (3 bois, 2 plastiques, 1 fer) \n3 : Créer une scierie (2 bois, 2 fers, 1 bronze, 1 metal) \n4 : Passer le tour");
    var action;
    do {
      if (action != null && !_isNumeric(action)) {
        print("Veuillez saisir un nombre valide");
      }
      action = stdin.readLineSync();
    } while (!_isNumeric(action));
    if (action != "4") {
      var x;
      var y;
      print("\nSur quelle coordonée X ?");
      do {
        if (x != null && !_isNumeric(x)) {
          print("Veuillez saisir une coordonée X valide");
        }
        x = stdin.readLineSync();
      } while (!_isNumeric(x));
      print("\nSur quelle coordonée Y ?");
      do {
        if (y != null && !_isNumeric(y)) {
          print("Veuillez saisir une coordonée Y valide");
        }
        y = stdin.readLineSync();
      } while (!_isNumeric(y));
      makeAction(int.parse(action), int.parse(x), int.parse(y));
    }
  }

  void makeAction(int action, int x, int y) {
    var object;
    switch (action) {
      case 1:
        object = Factory.withPosition(x, y);
        break;
      case 2:
        object = House.withPosition(x, y);
        break;
      case 3:
        object = Sawmill.withPosition(x, y);
        break;
      default:
        break;
    }
    print("\n\n\n");
    Board().replaceOnMap(x, y, object);
  }

  bool _isNumeric(String str) {
    if (str == null) {
      return false;
    }
    return double.tryParse(str) != null;
  }
}
