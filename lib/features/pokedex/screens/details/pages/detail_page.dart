import 'package:flutter/material.dart';
import 'package:pokedex/commons/models/pokemon.dart';
import 'package:pokedex/features/pokedex/screens/details/pages/widgets/detail_app_bar_widget.dart';
import 'package:pokedex/features/pokedex/screens/details/pages/widgets/detail_list_widget.dart';
import 'package:pokedex/features/pokedex/screens/details/pages/widgets/info_pokemon.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({
    super.key,
    required this.pokemon,
    required this.list,
    required this.onBack,
    required this.controller,
    required this.onChangePokemon,
  });
  final Pokemon pokemon;
  final List<Pokemon> list;
  final VoidCallback onBack;
  final PageController controller;
  final ValueChanged<Pokemon> onChangePokemon;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late ScrollController scrollController;
  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
  }
  bool isOnTop = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationListener(
        onNotification: (notification) {
          setState(() {
            if(scrollController.position.pixels>37){
              isOnTop = false;
            }else if(scrollController.position.pixels <= 36){
              isOnTop = true;
            }
          });
          return false;
        },
        child: CustomScrollView(
          controller: scrollController,
          physics: const ClampingScrollPhysics(),
          slivers: [
            DetailAppBarWidget(
              pokemon: widget.pokemon,
              onBack: widget.onBack,
              isOnTop: isOnTop,
            ),
            DetailListWidget(
              pokemon: widget.pokemon,
              list: widget.list,
              controller: widget.controller,
              onChangePokemon: widget.onChangePokemon,
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Stack(
                  children: [
                    Container(
                      color: widget.pokemon.baseColor,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24), 
                          topRight: Radius.circular(24),
                        ),               
                      ),
                      child: InfoPokemon(
                        pokemon: widget.pokemon,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
          ),
      ));
  }
}
