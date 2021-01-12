import '../lib.dart';

class City extends BaseObject {
  static final City _shared = City._internal();

  factory City() {
    return _shared;
  }

  City._internal();
}
