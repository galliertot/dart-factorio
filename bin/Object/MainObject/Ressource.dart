import '../lib.dart';

enum Ressource_Type { bois, fer, plastique, bronze, metal }

class Ressource extends BaseObject {
  Ressource_Type type;

  Ressource.withPosition(
      int x, int y, List<Ressource> cost, Ressource_Type type)
      : type = type,
        super.withPosition(x, y, cost);
  Ressource(Ressource_Type type)
      : type = type,
        super();
}
