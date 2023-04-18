import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/commons/repositories/repository2.dart';
import 'package:pokedex/features/pokedex/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pokedex flutter',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: PokedexRoute(
            repository: PokemonRepository(
              dio: Dio(),
            ),)
        );
  }
}
