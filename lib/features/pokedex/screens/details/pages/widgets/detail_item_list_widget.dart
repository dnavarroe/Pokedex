import 'package:flutter/material.dart';
import 'package:pokedex/commons/models/pokemon.dart';

class DetailItemListWidget extends StatelessWidget {
  const DetailItemListWidget({super.key, required this.isDiff, required this.pokemon});
  final bool isDiff;
  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 600),
        opacity: isDiff ? 0.4 : 1,
        child: TweenAnimationBuilder<double>(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeIn,
            tween:
                Tween<double>(end: isDiff ? 100 : 300, begin: isDiff ? 300 : 100),
            builder: (context, value, child) {
              return Image.network(
                pokemon.image,
                width: value,
                fit: BoxFit.contain,
                color: isDiff ? Colors.black.withOpacity(0.4) : null,
              );
            }),
      ),
    );
  }
}
