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

  get income {
    return (getListOfObjectType('Factory').length * 2) +
        (getListOfObjectType('House').length) +
        (getListOfObjectType('Sawmill').length * 2);
  }

  List<Ressource> ressources = List.generate(
      100,
      (index) => Ressource(Ressource_Type
          .values[Random().nextInt(Ressource_Type.values.length)]));

  List<Ressource> getListOfRessourceType(Ressource_Type type) {
    return ressources.where((ressource) => ressource.type == type).toList();
  }

  List<BaseObject> getListOfObjectType(String type) {
    return Game()
        .map
        .where((element) => element.runtimeType.toString() == type)
        .toList();
  }

  @override
  String toString() {
    // TODO: implement toString
    return 'Vous possèdé un revenue naturel de ${income} ressource(s). Vous avez les ressources : \n ${getListOfRessourceType(Ressource_Type.bois).length} bois \n ${getListOfRessourceType(Ressource_Type.fer).length} fer(s) \n ${getListOfRessourceType(Ressource_Type.plastique).length} plastique(s) \n ${getListOfRessourceType(Ressource_Type.bronze).length} bronze(s) \n ${getListOfRessourceType(Ressource_Type.metal).length} metal(s).\nVous êtes entrepreneur de \n ${getListOfObjectType("Sawmill").length} scierie(s) \n ${getListOfObjectType("House").length} maison(s) \n ${getListOfObjectType("Factory").length} usine(s). \n\n';
  }

  void removeRessource(List<Ressource> cost) {
    cost.forEach((cost) {
      this.ressources.removeAt(this
          .ressources
          .lastIndexWhere((element) => element.type == cost.type));
    });
  }

  void gainRessource() {
    this.ressources.addAll(List.generate(
        income,
        (index) => Ressource(Ressource_Type
            .values[Random().nextInt(Ressource_Type.values.length)])));
  }
}
