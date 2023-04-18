
import 'package:flutter/material.dart';
import 'package:pokedex/commons/models/pokemon.dart';
import 'package:pokedex/features/pokedex/screens/details/pages/widgets/circle_stat.dart';
import 'package:pokedex/features/pokedex/screens/details/pages/widgets/types_icon.dart';

class Weaknesses extends StatelessWidget {
  const Weaknesses({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Weaknesses: ',
            style: TextStyle(
                letterSpacing: 0.5,
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
          const SizedBox(width: 5),
          Row(
            children: pokemon.weaknesses.map((e) => IconType(type: e)).toList(),
          )
          
        ],
      ),
    );
  }
}

class Stats extends StatelessWidget {

  const Stats({super.key, required this.pokemon});
  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Stats',
            style: TextStyle(
                letterSpacing: 0.5,
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CircleStat(stat: pokemon.stats[0], statName: 'Hp', baseColor: pokemon.baseColor!),
              CircleStat(stat: pokemon.stats[1], statName: 'Attack', baseColor: pokemon.baseColor!)
            ],
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CircleStat(stat: pokemon.stats[2], statName: 'Defense', baseColor: pokemon.baseColor!),
              CircleStat(stat: pokemon.stats[3], statName: 'Special attack', baseColor: pokemon.baseColor!)
            ],
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CircleStat(stat: pokemon.stats[4], statName: 'Special defense', baseColor: pokemon.baseColor!),
              CircleStat(stat: pokemon.stats[5], statName: 'Speed', baseColor: pokemon.baseColor!),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleStat(stat: pokemon.stats[6], statName: 'Total', baseColor: pokemon.baseColor!),
            ],
          ),
        ],
      ),
    );
  }
}

class Description extends StatelessWidget {
  const Description({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Description',
            style: TextStyle(
                letterSpacing: 0.5,
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
          const SizedBox(height: 10),
          Text(
            pokemon.xdescription,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
    );
  }
}

class Types extends StatelessWidget {
  const Types({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Types: ',
            style: TextStyle(
                letterSpacing: 0.5,
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
          const SizedBox(width: 5),
          Row(
            children: pokemon.types.map((e) => IconType(type: e)).toList(),
          )
          
        ],
      ),
    );
  }
}