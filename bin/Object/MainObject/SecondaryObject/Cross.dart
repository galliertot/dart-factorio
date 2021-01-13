import '../../lib.dart';

class Cross extends Building {
  String get icon {
    return ' ❌ ';
  }

  Cross.withPosition(int x, int y) : super.withPosition(x, y, []);
  Cross() : super();
}
