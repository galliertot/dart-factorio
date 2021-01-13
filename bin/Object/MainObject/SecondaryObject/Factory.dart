import '../../lib.dart';

class Factory extends Building {
  String get icon {
    return ' 🔥 ';
  }

  Factory.withPosition(int x, int y)
      : super.withPosition(x, y, [
          Ressource(Ressource_Type.bois),
          Ressource(Ressource_Type.metal),
          Ressource(Ressource_Type.fer),
          Ressource(Ressource_Type.fer),
          Ressource(Ressource_Type.bronze),
          Ressource(Ressource_Type.metal)
        ]);
  Factory() : super();

  String cost() {
    return '2 fers, 2 metals, 1 bois, 1 bronze';
  }
}
