import '../../lib.dart';

enum CrossType { around, almost, none }

class Cross extends Building {
  CrossType type;
  String get icon {
    switch (type) {
      case CrossType.almost:
        return ' 🥵 ';
      case CrossType.around:
        return ' 😶 ';
      case CrossType.none:
        return ' 🥶 ';
    }
  }

  Cross.withPosition(int x, int y, CrossType type)
      : type = type,
        super.withPosition(x, y, []);
  Cross() : super();
}
