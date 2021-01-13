import '../lib.dart';

enum Ressource_Type { bois, fer, plastique, or, metal }

class Ressource extends BaseObject {
  Ressource_Type type;

  Ressource.withPosition(int x, int y, Ressource_Type type)
      : type = type,
        super.withPosition(x, y);
  Ressource(Ressource_Type type)
      : type = type,
        super();
}
