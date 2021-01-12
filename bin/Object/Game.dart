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

  BaseObject randomObject() {
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
    return list[Random().nextInt(list.length)];
  }

  void run() {
    print("Bienvenue dans le petit jeu de toto, entrer votre nom :");
    User().name = stdin.readLineSync();
    print("C'est parti ${User().name} ! \n\n\n");
    map = List.generate(100, (index) => randomObject());
    Board().showMap();
    // while (true) {
    //   updatables.forEach((element) {
    //     element.update();
    //   });
    // }
  }
}
