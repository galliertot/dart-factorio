import '../../lib.dart';

class Factory extends Building {
  String get icon {
    return ' 🔥 ';
  }

  Factory.withPosition(int x, int y) : super.withPosition(x, y);
  Factory() : super();
}
