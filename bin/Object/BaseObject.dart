import 'lib.dart';

class BaseObject implements UpdateGame {
  DateTime created_at;
  String icon;
  int x;
  int y;

  BaseObject.withPosition(int x, int y) {
    this.created_at = DateTime.now();
    this.icon = null;
    this.x = x;
    this.y = y;
  }

  BaseObject() {
    this.created_at = DateTime.now();
    this.icon = null;
  }

  set setX(int x) {
    x = x;
  }

  set setY(int y) {
    y = y;
  }

  void update() {
    print(this.runtimeType.toString() + " à été mis à jour");
  }
}
