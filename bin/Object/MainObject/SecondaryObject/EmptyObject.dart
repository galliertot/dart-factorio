import '../../lib.dart';

class EmptyObject extends BaseObject {
  String get icon {
    return ' ⚪ ';
  }

  EmptyObject.withPosition(int x, int y) : super.withPosition(x, y);
  EmptyObject() : super();
}
