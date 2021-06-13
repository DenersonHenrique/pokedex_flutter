import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_pokedex/models/pokeApi.dart';
import 'package:flutter_pokedex/app/constants/consts_app.dart';
import 'package:flutter_pokedex/pages/poke_detail/poke_detail_page.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_pokedex/app/modules/home_pokedex/ui/home_page/widgets/poke_item.dart';
import 'package:flutter_pokedex/app/modules/home_pokedex/ui/home_page/widgets/app_bar_home.dart';
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
    if (_pokedexHomeController.pokeAPI == null)
      _pokedexHomeController.fetchPokemonList();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width; //Get screen size.
    double statusWidth =
        MediaQuery.of(context).padding.top; //Get statusbar size.
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: <Widget>[
          // Pokeball position.
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
          // Page Content
          Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: statusWidth,
                ),
                AppBarHome(),
                // Pokemon List
                Expanded(
                  child: Container(
                    child: Observer(
                      builder: (BuildContext context) {
                        return (_pokedexHomeController.pokeAPI != null)
                            ? AnimationLimiter(
                                child: GridView.builder(
                                  physics: BouncingScrollPhysics(),
                                  padding: EdgeInsets.all(12),
                                  addAutomaticKeepAlives:
                                      true, // Not recreate items.
                                  gridDelegate:
                                      new SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2),
                                  itemCount: _pokedexHomeController
                                      .pokeAPI.pokemon.length, // List size
                                  itemBuilder: (context, index) {
                                    Pokemon pokemon = _pokedexHomeController
                                        .getPokemon(index: index);
                                    return AnimationConfiguration.staggeredGrid(
                                      position: index,
                                      duration:
                                          const Duration(milliseconds: 375),
                                      columnCount: 2,
                                      child: ScaleAnimation(
                                        child: GestureDetector(
                                          // PokeItem
                                          child: PokeItem(
                                            types: pokemon.type,
                                            index: index,
                                            name: pokemon.name,
                                            num: pokemon.num,
                                          ),
                                          onTap: () {
                                            _pokedexHomeController
                                                .setCurrentPokemon(
                                                    index: index);
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder:
                                                      (BuildContext context) =>
                                                          PokeDetailPage(
                                                              index: index),
                                                  fullscreenDialog: true,
                                                ));
                                          },
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              )
                            : Center(
                                child:
                                    CircularProgressIndicator(), // Load indicator.
                              );
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
