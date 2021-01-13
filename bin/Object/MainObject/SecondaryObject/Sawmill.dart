import '../../lib.dart';

class Sawmill extends Building {
  String get icon {
    return ' 🔪 ';
  }

  Sawmill.withPosition(int x, int y) : super.withPosition(x, y);
  Sawmill() : super();
}
