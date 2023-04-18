import 'dart:ffi';

import 'package:flutter/material.dart';

class Pokemon {
  final String name;
  final String id;
  final String imageurl;
  final String xdescription;
  final List<String> types;
  final List<String> weaknesses;
  final List<String> evolutions;
  final String evolvedfrom;
  final String reason;
  final List<int> stats;

  factory Pokemon.fromMap(Map<String, dynamic> json) {
    return Pokemon(
        name: json['name'],
        id: json['id'],
        imageurl: json['imageurl'],
        xdescription: json['xdescription'],
        types: (json['typeofpokemon'] as List<dynamic>)
            .map((e) => e as String)
            .toList(),
        weaknesses: (json['weaknesses'] as List<dynamic>)
            .map((e) => e as String)
            .toList(),
        evolutions: (json['evolutions'] as List<dynamic>)
            .map((e) => e as String)
            .toList(),
        evolvedfrom: json['evolvedfrom'],
        reason: json['reason'],
        stats: [
          json['hp'],
          json['attack'],
          json['defense'],
          json['special_attack'],
          json['special_defense'],
          json['speed'],
          json['total'],
        ]);
  }

  Pokemon({
    required this.name,
    required this.id,
    required this.imageurl,
    required this.xdescription,
    required this.types,
    required this.weaknesses,
    required this.evolvedfrom,
    required this.reason,
    required this.stats,
    required this.evolutions
  });
  Color? get baseColor => _color(type: types[0]);

  static Color? _color({required String type}) {
    switch (type) {
      case 'Normal':
        return Colors.brown[400];
      case 'Fire':
        return Colors.red;
      case 'Water':
        return Colors.blue;
      case 'Grass':
        return Colors.green;
      case 'Electric':
        return Colors.amber;
      case 'Ice':
        return Colors.cyanAccent[400];
      case 'Fighting':
        return Colors.orange;
      case 'Poison':
        return Colors.purple;
      case 'Ground':
        return Colors.orange[300];
      case 'Flying':
        return Colors.indigo[200];
      case 'Psychic':
        return Colors.pink;
      case 'Bug':
        return Colors.lightGreen[500];
      case 'Rock':
        return Colors.grey;
      case 'Ghost':
        return Colors.indigo[400];
      case 'Dark':
        return Colors.brown;
      case 'Dragon':
        return Colors.indigo[800];
      case 'Steel':
        return Colors.blueGrey;
      case 'Fairy':
        return Colors.pinkAccent[100];
      default:
        return Colors.grey;
    }
  }
}
