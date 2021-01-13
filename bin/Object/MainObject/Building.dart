import '../lib.dart';

class Building extends BaseObject {
  Building.withPosition(int x, int y, List<Ressource> cost)
      : super.withPosition(x, y, cost);
  Building() : super();
}
