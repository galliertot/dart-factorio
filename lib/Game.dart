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
  String charlie;
  bool charlieIsFound = false;
  int xCharlie;
  int yCharlie;
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

  void typeOfGame() {
    print(
        "Quel version du jeu voulez-vous jouer ? \n 1 : Version normale\n 2 : Version Charlie");
    do {
      if (charlie != null && !_isNumeric(charlie)) {
        print("Veuillez saisir un nombre valide");
      }
      charlie = stdin.readLineSync();
    } while (!_isNumeric(charlie));
  }

  void run() {
    print("Bienvenue dans le petit jeu de toto, entrer votre nom :");
    User().name = stdin.readLineSync();
    typeOfGame();
    print("C'est parti ${User().name} ! \n\n\n");
    int turn = 1;
    if (int.parse(charlie) == 1) {
      map =
          List.generate(100, (index) => randomObject(index % 10, index ~/ 10));
      while (true) {
        if (Platform.isWindows) {
          print(Process.runSync("cls", [], runInShell: true).stdout);
        } else {
          print(Process.runSync("clear", [], runInShell: true).stdout);
        }
        Board().showMap();
        User().gainRessource();
        print(User().toString());
        askAction(turn);
        turn += 1;
      }
    } else {
      map = List.generate(100, (index) => EmptyObject());
      xCharlie = Random().nextInt(9);
      yCharlie = Random().nextInt(9);
      while (!charlieIsFound) {
        if (Platform.isWindows) {
          print(Process.runSync("cls", [], runInShell: true).stdout);
        } else {
          print(Process.runSync("clear", [], runInShell: true).stdout);
        }
        Board().showMap();
        askActionCharlie(turn);
        turn += 1;
      }
    }
    print("\n\nBravo ! Vous avez fini en ${turn} tours");
  }

  void askActionCharlie(int turn) {
    print("\n\nTour n°${turn}");
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
    makeActionCharlie(int.parse(x), int.parse(y));
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
    } else {
      print("\n\n");
    }
  }

  void makeActionCharlie(int x, int y) {
    var object;
    var found = (x == xCharlie && y == yCharlie);
    if (found) {
      object = Charlie.withPosition(x, y);
      charlieIsFound = true;
      print("\n\n\n");
      Board().replaceOnMap(x, y, object);
      Board().showMap();
    } else {
      object = checkIfCharlieIsArround(x, y);
      print("\n\n\n");
      Board().replaceOnMap(x, y, object);
    }
  }

  Cross checkIfCharlieIsArround(int x, int y) {
    for (int i = x - 1; i <= x + 1; i++) {
      for (int j = y - 1; j <= y + 1; j++) {
        if (i == xCharlie && j == yCharlie) {
          return Cross.withPosition(x, y, CrossType.almost);
        }
      }
    }

    for (int i = x - 2; i <= x + 2; i++) {
      for (int j = y - 2; j <= y + 2; j++) {
        if (i == xCharlie && j == yCharlie) {
          return Cross.withPosition(x, y, CrossType.around);
        }
      }
    }

    return Cross.withPosition(x, y, CrossType.none);
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
