import '../../lib.dart';

class Sawmill extends Building {
  String get icon {
    return ' 🔪 ';
  }

  Sawmill.withPosition(int x, int y)
      : super.withPosition(x, y, [
          Ressource(Ressource_Type.bois),
          Ressource(Ressource_Type.bois),
          Ressource(Ressource_Type.fer),
          Ressource(Ressource_Type.fer),
          Ressource(Ressource_Type.bronze),
          Ressource(Ressource_Type.metal)
        ]);
  Sawmill() : super();

  String cost() {
    return '2 bois, 2 fers, 1 bronze, 1 metal';
  }
}
