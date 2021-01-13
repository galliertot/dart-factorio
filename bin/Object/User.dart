import 'dart:io';
import 'lib.dart';
import "dart:math";

class User {
  // Singleton
  static final User _shared = User._internal();
  factory User() {
    return _shared;
  }
  User._internal();

  String name;
  int income = 10;
  List<Ressource> ressources = List.generate(
      100,
      (index) => Ressource(Ressource_Type
          .values[Random().nextInt(Ressource_Type.values.length)]));

  BaseObject randomRessource() {}

  List<Ressource> getListOfRessourceType(Ressource_Type type) {
    return ressources.where((ressource) => ressource.type == type).toList();
  }

  @override
  String toString() {
    // TODO: implement toString
    return 'Vous possèdé un revenue naturel de ${income} et les ressources : ${getListOfRessourceType(Ressource_Type.bois).length} bois, ${getListOfRessourceType(Ressource_Type.fer).length} fer(s), ${getListOfRessourceType(Ressource_Type.plastique).length} plastique(s), ${getListOfRessourceType(Ressource_Type.or).length} or(s), ${getListOfRessourceType(Ressource_Type.metal).length} metal(s)';
  }
}
