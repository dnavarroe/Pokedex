import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:pokedex/commons/error/fail.dart';
import 'package:pokedex/commons/models/pokemon.dart';

abstract class IPokemonRepository{
  Future<List<Pokemon>> getAllPokemons2();
}

class PokemonRepository implements IPokemonRepository{
  final Dio dio;

  PokemonRepository({required this.dio});
  @override
  Future<List<Pokemon>> getAllPokemons2() async {
    try {
      final response = await dio.get('https://gist.githubusercontent.com/hungps/0bfdd96d3ab9ee20c2e572e47c6834c7/raw/pokemons.json');
      final json = jsonDecode(response.data) as List<dynamic>;
      return json.map((e) => Pokemon.fromMap(e)).toList();
    } catch (e) {
      throw Fail(message:'No fue posible cargar los datos');
    }
  }
}