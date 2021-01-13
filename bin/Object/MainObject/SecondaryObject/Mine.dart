import '../../lib.dart';

class Mine extends Environment {
  String get icon {
    return ' ⛏  ';
  }

  Mine.withPosition(int x, int y) : super.withPosition(x, y, null);
  Mine() : super();
}
