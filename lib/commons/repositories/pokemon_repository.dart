import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:pokedex/commons/consts/api_const.dart';
import 'package:pokedex/commons/error/fail.dart';
import 'package:pokedex/commons/models/pokemon.dart';

abstract class IPokemonRepository{
  Future<List<Pokemon>> getAllPokemons();
}

class PokemonRepository implements IPokemonRepository{
  final Dio dio;

  PokemonRepository({required this.dio});
  @override
  Future<List<Pokemon>> getAllPokemons() async {
    try {
      final response = await dio.get(ApiConst.allpokemonsURL);
      final json = jsonDecode(response.data) as Map<String, dynamic>;
      final list = json['pokemon'] as List<dynamic>;
      return list.map((e) => Pokemon.fromMap(e)).toList();
    } catch (e) {
      throw Fail(message:'No fue posible cargar los datos');
    }
  }
}