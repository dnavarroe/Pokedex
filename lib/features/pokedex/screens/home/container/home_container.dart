
import 'package:flutter/material.dart';
import 'package:pokedex/commons/error/fail.dart';
import 'package:pokedex/commons/models/pokemon.dart';
import 'package:pokedex/commons/repositories/repository2.dart';
import 'package:pokedex/features/pokedex/screens/details/container/detail_container.dart';
import '../pages/home_error.dart';
import '../pages/home_loading.dart';
import '../pages/home_page.dart';

class HomeContainer extends StatelessWidget {
  const HomeContainer({
    super.key,
    required this.onItemTap, 
    required this.repository,
  });
  final IPokemonRepository repository;
  final Function(String, DetailArguments) onItemTap;
  

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pokemon>>(
      future: repository.getAllPokemons2(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const HomeLoading();
        }
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          return HomePage(list: snapshot.data!, onItemTap: onItemTap,);
        }
        if (snapshot.hasError) {
          return HomeError(error: (snapshot.error as Fail).message!);
        }
        return Container();
      },
    );
  }
}
