import 'package:flutter/cupertino.dart';
import 'package:pokedex/commons/models/pokemon.dart';
import 'package:pokedex/features/pokedex/screens/details/pages/widgets/details_some_widgets.dart';

class InfoPokemon extends StatelessWidget {
  const InfoPokemon({super.key, required this.pokemon});
  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Description(pokemon: pokemon),
        Types(pokemon: pokemon),
        Weaknesses(pokemon: pokemon),
        Stats(pokemon: pokemon),
      ],
    );
  }
}






