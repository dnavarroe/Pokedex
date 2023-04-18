import 'package:flutter/material.dart';
import 'package:pokedex/commons/models/pokemon.dart';
import 'package:pokedex/features/pokedex/screens/details/container/detail_container.dart';
import 'package:pokedex/features/pokedex/screens/home/pages/widgets/type_widget.dart';

class PokemonItemWidget extends StatelessWidget {
  const PokemonItemWidget({
    super.key,
    required this.pokemon,
    required this.onTap,
    required this.index,
  });
  final Pokemon pokemon;
  final Function(String, DetailArguments) onTap;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(
        '/details',
        DetailArguments(pokemon: pokemon, index: index),
      ),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                color: pokemon.baseColor!.withOpacity(0.8),
                borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          pokemon.name,
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ),
                      Text(
                        pokemon.id,
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.6),
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      )
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: pokemon.types
                            .map((e) => TypeWidget(name: e))
                            .toList(),
                      ),
                      Flexible(
                        child: Container(
                        height: 100,
                        width: 100,
                      ))
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
            right: 2,
            bottom: 10,
            child: Opacity(
                opacity: 0.3,
                child: Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.rotationZ(0.4),
                  child: Image.asset(
                    'assets/pokeball.png',
                    height: 120,
                  ),
                ),
              ),
          ),
          Positioned(
            right: 2,
            bottom: 10,
            child: Image.network(
              pokemon.imageurl,
              height: 120,
            ),
          )
        ],
      ),
    );
  }
}
