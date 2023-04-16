import 'package:flutter/material.dart';
import 'package:pokedex/commons/models/pokemon.dart';

class DetailAppBarWidget extends StatelessWidget {
  const DetailAppBarWidget({
    super.key,
    required this.pokemon,
    required this.onBack,
    required this.isOnTop,
  });
  final Pokemon pokemon;
  final VoidCallback onBack;
  final bool isOnTop;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      elevation: 0,
      backgroundColor: pokemon.baseColor,
      leading: IconButton(
        onPressed: onBack,
        icon: const Icon(Icons.chevron_left),
      ),
      title: AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: isOnTop?0:1,
            child: Text(
                pokemon.name,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
          ),
    );
  }
}
