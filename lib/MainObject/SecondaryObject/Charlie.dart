import '../../lib.dart';

class Charlie extends Building {
  String get icon {
    return ' 👶 ';
  }

  Charlie.withPosition(int x, int y) : super.withPosition(x, y, []);
  Charlie() : super();
}
