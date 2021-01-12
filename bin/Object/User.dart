import 'dart:io';
import 'lib.dart';

class User {
  // Singleton
  static final User _shared = User._internal();
  factory User() {
    return _shared;
  }
  User._internal();

  String name;
  int income;
  List<Ressource> ressources;
}
