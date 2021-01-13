import '../../lib.dart';

class House extends Building {
  String get icon {
    return ' 🏡 ';
  }

  House.withPosition(int x, int y) : super.withPosition(x, y);
  House() : super();
}
