import 'lib.dart';

class BaseObject implements UpdateGame {
  String id;
  String name;
  DateTime created_at;
  String icon;

  BaseObject({
    this.id,
    this.name,
    this.created_at,
    this.icon,
  });

  void update() {
    print(this.name + " à été mis à jour");
  }
}
