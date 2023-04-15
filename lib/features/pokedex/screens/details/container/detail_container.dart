import 'package:flutter/material.dart';
import 'package:pokedex/commons/error/fail.dart';
import 'package:pokedex/commons/models/pokemon.dart';
import 'package:pokedex/commons/repositories/pokemon_repository.dart';
import 'package:pokedex/commons/widgets/po_error.dart';
import 'package:pokedex/commons/widgets/po_loading.dart';
import 'package:pokedex/features/pokedex/screens/details/pages/detail_page.dart';

class DetailArguments{
  DetailArguments({required this.pokemon});
  final Pokemon pokemon;
}

class DetailContainer extends StatelessWidget {
  const DetailContainer({super.key, required this.repository, required this.arguments});
  final IPokemonRepository repository;
  final DetailArguments arguments;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pokemon>>(
      future: repository.getAllPokemons(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const PoLoading();
        }
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          return DetailPage(pokemon: arguments.pokemon, list: snapshot.data!,);
        }
        if (snapshot.hasError) {
          return PoError(error: (snapshot.error as Fail).message!);
        }
        return Container();
      },
    );
  }
}
