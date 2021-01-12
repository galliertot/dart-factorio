import '../lib.dart';

enum Ressource_Type { bois, fer, plastique, or, metal }

class Ressource extends BaseObject {
  Ressource_Type type;
  Ressource({
    this.type,
  });
}
