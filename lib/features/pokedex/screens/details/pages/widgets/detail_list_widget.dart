import 'package:flutter/material.dart';
import 'package:pokedex/commons/models/pokemon.dart';
import 'package:pokedex/features/pokedex/screens/details/pages/widgets/detail_item_list_widget.dart';

class DetailListWidget extends StatelessWidget {
  const DetailListWidget({
    super.key,
    required this.pokemon,
    required this.list,
    required this.controller,
    required this.onChangePokemon,
  });
  final Pokemon pokemon;
  final List<Pokemon> list;
  final PageController controller;
  final ValueChanged<Pokemon> onChangePokemon;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        color: pokemon.baseColor,
        child: Stack(
          children: [
            Positioned(
              top: 60,
              left: 120,
              child: Opacity(
                opacity: 0.3,
                child: Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.rotationZ(0.4),
                  child: Image.asset(
                    'assets/pokeball.png',
                    height: 250,
                  ),
                ),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Text(
                          pokemon.name,
                          style: const TextStyle(
                            fontSize: 36,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        pokemon.id,
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 300,
                  width: double.infinity,
                  child: PageView(
                    onPageChanged: (index) => onChangePokemon(list[index]),
                    controller: controller,
                    children: list.map((e) {
                      bool diff = e.name != pokemon.name;
                      return DetailItemListWidget(isDiff: diff, pokemon: e);
                    }).toList(),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
