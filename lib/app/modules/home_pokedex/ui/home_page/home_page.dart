import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_pokedex/app/constants/consts_app.dart';
import 'package:flutter_pokedex/app/modules/home_pokedex/ui/home_page/widgets/poke_list_widget.dart';
import 'package:flutter_pokedex/app/modules/home_pokedex/ui/home_page/widgets/app_bar_home_widget.dart';
import 'package:flutter_pokedex/app/modules/home_pokedex/ui/home_page/controller/pokedex_home_controller.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PokedexHomeController _pokedexHomeController;

  @override
  void initState() {
    super.initState();
    _pokedexHomeController = GetIt.instance<PokedexHomeController>();
    if (_pokedexHomeController.pokemonList == null)
      _pokedexHomeController.fetchPokemonList();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width; // Get screen size.
    double statusWidth =
        MediaQuery.of(context).padding.top; // Get statusbar size.
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: <Widget>[
          Positioned(
            top: MediaQuery.of(context).padding.top - 240 / 2.7,
            left: screenWidth - (240 / 1.6),
            child: Opacity(
              child: Image.asset(
                ConstsApp.blackPokeball, // Image black pokeball.
                height: 240,
                width: 240,
              ),
              opacity: 0.1,
            ),
          ),
          Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: statusWidth,
                ),
                AppBarHome(),
                Observer(
                  builder: (BuildContext context) {
                    return _pokedexHomeController.pokemonList != null
                        ? Expanded(
                            child: Container(
                              child: PokeListWidget(
                                getPokemon: _pokedexHomeController.getPokemon,
                                pokemonList: _pokedexHomeController.pokemonList,
                                setCurrentPokemon:
                                    _pokedexHomeController.setCurrentPokemon,
                              ),
                            ),
                          )
                        : Center(
                            child: CircularProgressIndicator(),
                          );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
