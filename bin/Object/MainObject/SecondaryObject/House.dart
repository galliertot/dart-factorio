import '../../lib.dart';

class House extends Building {
  String get icon {
    return ' 🏡 ';
  }

  House.withPosition(int x, int y)
      : super.withPosition(x, y, [
          Ressource(Ressource_Type.bois),
          Ressource(Ressource_Type.bois),
          Ressource(Ressource_Type.bois),
          Ressource(Ressource_Type.plastique),
          Ressource(Ressource_Type.plastique),
          Ressource(Ressource_Type.fer)
        ]);
  House() : super();

  String cost() {
    return '3 bois, 2 plastiques, 1 fer';
  }
}
