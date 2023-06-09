import 'package:flutter/material.dart';
import 'package:pokedex/commons/error/fail.dart';
import 'package:pokedex/commons/models/pokemon.dart';
import 'package:pokedex/commons/repositories/repository2.dart';
import 'package:pokedex/commons/widgets/po_error.dart';
import 'package:pokedex/commons/widgets/po_loading.dart';
import 'package:pokedex/features/pokedex/screens/details/pages/detail_page.dart';

class DetailArguments {
  DetailArguments({this.index = 0, required this.pokemon});
  final Pokemon pokemon;
  final int? index;
}

class DetailContainer extends StatefulWidget {
  const DetailContainer({
    super.key,
    required this.repository,
    required this.arguments,
    required this.onBack,
  });
  final IPokemonRepository repository;
  final DetailArguments arguments;
  final VoidCallback onBack;

  @override
  State<DetailContainer> createState() => _DetailContainerState();
}

class _DetailContainerState extends State<DetailContainer> {

  late PageController _controller;
  late Future<List<Pokemon>> _future;
  Pokemon? _pokemon;
  @override
  void initState() {
    _controller = PageController(
      viewportFraction: 0.5,
      initialPage: widget.arguments.index!
    );
    _future = widget.repository.getAllPokemons2();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pokemon>>(
      future: _future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const PoLoading();
        }
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
            if(_pokemon == null){
              _pokemon = widget.arguments.pokemon;
            }else{

            }
          return DetailPage(
            pokemon: _pokemon!,
            list: snapshot.data!,
            onBack: widget.onBack, 
            controller: _controller, 
            onChangePokemon: (Pokemon value) { 
              setState(() {
                _pokemon = value;
              });
            },
          );
        }
        if (snapshot.hasError) {
          return PoError(error: (snapshot.error as Fail).message!);
        }
        return Container();
      },
    );
  }
}
