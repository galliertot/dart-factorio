import '../lib.dart';

class Environment extends BaseObject {
  Environment.withPosition(
    int x,
    int y,
    List<Ressource> cost,
  ) : super.withPosition(x, y, cost);
  Environment() : super();
}
