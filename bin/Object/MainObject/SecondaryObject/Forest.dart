import '../../lib.dart';

class Forest extends Environment {
  String get icon {
    return ' 🌳 ';
  }

  Forest.withPosition(int x, int y) : super.withPosition(x, y, []);
  Forest() : super();
}
