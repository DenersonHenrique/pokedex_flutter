import 'package:flutter_pokedex/app/constants/consts_api.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:sliding_sheet/sliding_sheet.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:flutter_pokedex/app/constants/app_string.dart';
import 'package:flutter_pokedex/app/constants/consts_app.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:simple_animations/simple_animations/multi_track_tween.dart';
import 'package:flutter_pokedex/app/modules/home_pokedex/domain/entity/pokemon_entity.dart';
import 'package:flutter_pokedex/app/modules/poke_detail/ui/detail_page/widgets/about_item_widget.dart';
import 'package:flutter_pokedex/app/modules/poke_detail/ui/detail_page/widgets/pokemon_header_widget.dart';
import 'package:flutter_pokedex/app/modules/home_pokedex/ui/home_page/controller/pokedex_home_controller.dart';
import 'package:flutter_pokedex/app/modules/poke_detail/ui/detail_page/controller/pokemon_detail_controller.dart';

class PokeDetailPage extends StatefulWidget {
  final int index;

  PokeDetailPage({Key key, this.index}) : super(key: key);

  @override
  _PokeDetailPageState createState() => _PokeDetailPageState();
}

class _PokeDetailPageState extends State<PokeDetailPage> {
  double _opacity;
  double _progress;
  double _multiple;
  double _opacityTitleAppBar;
  MultiTrackTween _animation;
  PageController _pageController;
  PokedexHomeController _pokedexHomeController;
  PokemonDetailController _pokemonDetailController;

  @override
  void initState() {
    super.initState();
    _pageController =
        PageController(initialPage: widget.index, viewportFraction: 0.5);
    _pokedexHomeController = GetIt.instance<PokedexHomeController>();
    _pokemonDetailController = GetIt.instance<PokemonDetailController>();
    _pokemonDetailController
        .getInfoPokemon(_pokedexHomeController.currentPokemon.id);
    _pokemonDetailController
        .getInfoSpecie(_pokedexHomeController.currentPokemon.id.toString());
    _animation = MultiTrackTween([
      Track("rotation").add(Duration(seconds: 5), Tween(begin: 0.0, end: 6.0),
          curve: Curves.linear)
    ]);
    _opacity = 1;
    _progress = 0;
    _multiple = 1;
    _opacityTitleAppBar = 0;
  }

  double interval(
    double lower,
    double upper,
    double progress,
  ) {
    assert(lower < upper);
    if (progress > upper) return 1.0;
    if (progress < lower) return 0.0;
    return ((progress - lower) / (upper - lower)).clamp(0.0, 1.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Observer(
            builder: (context) {
              return AnimatedContainer(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      _pokedexHomeController.pokeColor.withOpacity(0.7),
                      _pokedexHomeController.pokeColor,
                    ],
                  ),
                ),
                child: Stack(
                  children: <Widget>[
                    AppBar(
                      centerTitle: true,
                      elevation: 0,
                      backgroundColor: Colors.transparent,
                      leading: Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          IconButton(
                            icon: Icon(Icons.arrow_back),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                      actions: <Widget>[
                        Align(
                          alignment: Alignment.centerRight,
                          child: Stack(
                            alignment: Alignment.center,
                            children: <Widget>[
                              ControlledAnimation(
                                playback: Playback.LOOP,
                                duration: _animation.duration,
                                tween: _animation,
                                builder: (context, animation) {
                                  return Transform.rotate(
                                    child: Opacity(
                                      child: Image.asset(
                                        ConstsApp.whitePokeball,
                                        height: 50,
                                        width: 50,
                                      ),
                                      opacity: _opacityTitleAppBar >= 0.2
                                          ? 0.2
                                          : 0.0,
                                    ),
                                    angle: animation['rotation'],
                                  );
                                },
                              ),
                              IconButton(
                                icon: Icon(Icons.favorite_border),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    PokemonHeaderWidget(
                      progress: _progress,
                      pokeName: _pokedexHomeController.currentPokemon.name,
                      pokeNumber: _pokedexHomeController.currentPokemon.number,
                      pokeType: _pokedexHomeController.currentPokemon.type,
                    ),
                  ],
                ),
                duration: Duration(milliseconds: 300),
              );
            },
          ),
          SlidingSheet(
            listener: (state) {
              setState(() {
                _progress = state.progress;
                _multiple = 1 - interval(0.50, 0.86, _progress);
                _opacity = _multiple;
                _opacityTitleAppBar =
                    _multiple = interval(0.50, 0.86, _progress);
              });
            },
            elevation: 0,
            cornerRadius: 30,
            snapSpec: const SnapSpec(
              snap: true,
              snappings: [0.60, 0.86],
              positioning: SnapPositioning.relativeToAvailableSpace,
            ),
            builder: (context, state) {
              return Container(
                height: MediaQuery.of(context).size.height -
                    MediaQuery.of(context).size.height * 0.14,
                child: AboutItemWidget(),
              );
            },
          ),
          Opacity(
            child: Padding(
              child: SizedBox(
                height: 200,
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (index) {
                    _pokedexHomeController.setCurrentPokemon(
                      index: index,
                    );
                    _pokemonDetailController.getInfoPokemon(
                      _pokedexHomeController.currentPokemon.id,
                    );
                    _pokemonDetailController.getInfoSpecie(
                      _pokedexHomeController.currentPokemon.id.toString(),
                    );
                  },
                  itemCount: _pokedexHomeController
                      .pokemonList.pokemonListEntity.length,
                  itemBuilder: (BuildContext context, int index) {
                    PokemonEntity _pokeItem =
                        _pokedexHomeController.getPokemon(index: index);
                    return Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        ControlledAnimation(
                          playback: Playback.LOOP,
                          duration: _animation.duration,
                          tween: _animation,
                          builder: (context, animation) {
                            return Transform.rotate(
                              child: AnimatedOpacity(
                                child: Image.asset(
                                  ConstsApp.whitePokeball,
                                  height: 210,
                                  width: 210,
                                ),
                                opacity: index ==
                                        _pokedexHomeController.currentPosition
                                    ? 0.2
                                    : 0,
                                duration: Duration(milliseconds: 200),
                              ),
                              angle: animation['rotation'],
                            );
                          },
                        ),
                        IgnorePointer(
                          child: Observer(
                            name: AppString.pokemonName,
                            builder: (context) {
                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  AnimatedPadding(
                                    child: Hero(
                                      child: CachedNetworkImage(
                                          height: 135,
                                          width: 135,
                                          placeholder: (context, url) =>
                                              new Container(
                                                color: Colors.transparent,
                                              ),
                                          color: index ==
                                                  _pokedexHomeController
                                                      .currentPosition
                                              ? null
                                              : Colors.black.withOpacity(0.5),
                                          imageUrl:
                                              '${ConstsApi.pokeImageUrl}${_pokeItem.number}.png'),
                                      tag: index ==
                                              _pokedexHomeController
                                                  .currentPosition
                                          ? _pokeItem.name
                                          : 'none' + index.toString(),
                                    ),
                                    duration: Duration(milliseconds: 400),
                                    curve: Curves.easeIn,
                                    padding: EdgeInsets.only(
                                      top: index ==
                                              _pokedexHomeController
                                                  .currentPosition
                                          ? 0
                                          : 60,
                                      bottom: index ==
                                              _pokedexHomeController
                                                  .currentPosition
                                          ? 0
                                          : 60,
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              padding: EdgeInsets.only(
                  top: _opacityTitleAppBar == 1
                      ? 1000
                      : (MediaQuery.of(context).size.height * 0.25) -
                          _progress * 50),
            ),
            opacity: _opacity,
          )
        ],
      ),
    );
  }
}
