import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_pokedex/consts/consts_app.dart';
import 'package:flutter_pokedex/models/pokeApi.dart';
import 'package:flutter_pokedex/stores/poke_api-store.dart';
import 'package:flutter_pokedex/stores/poke_apiv2-store.dart';
import 'package:get_it/get_it.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:simple_animations/simple_animations/multi_track_tween.dart';
import 'package:sliding_sheet/sliding_sheet.dart';
import 'package:flutter_pokedex/pages/poke_detail/widgets/about_item.dart';

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
  PokeApiStore _pokemonStore;
  PokeApiV2Store _pokeApiV2Store;
  MultiTrackTween _animation;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController =
        PageController(initialPage: widget.index, viewportFraction: 0.5);
    _pokemonStore = GetIt.instance<PokeApiStore>();
    _pokeApiV2Store = GetIt.instance<PokeApiV2Store>();
    _pokeApiV2Store.getInfoPokemon(_pokemonStore.currentPokemon.name);
    _pokeApiV2Store.getInfoSpecie(_pokemonStore.currentPokemon.id.toString());
    _animation = MultiTrackTween([
      Track("rotation").add(Duration(seconds: 5), Tween(begin: 0.0, end: 6.0),
          curve: Curves.linear)
    ]);
    _opacity = 1;
    _progress = 0;
    _multiple = 1;
    _opacityTitleAppBar = 0;
  }

  double interval(double lower, double upper, double progress) {
    assert(lower < upper);

    if (progress > upper) return 1.0;
    if (progress < lower) return 0.0;

    return ((progress - lower) / (upper - lower)).clamp(0.0, 1.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: _pokeColor,//Scaffold
      body: Stack(children: <Widget>[
        Observer(
          builder: (context) {
            return AnimatedContainer(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    _pokemonStore.pokeColor.withOpacity(0.7),
                    _pokemonStore.pokeColor,
                  ])),
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
                                    opacity:
                                        _opacityTitleAppBar >= 0.2 ? 0.2 : 0.0,
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
                  // Title - Pokemon name
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.12 -
                        _progress *
                            (MediaQuery.of(context).size.height * 0.060),
                    left: 20 +
                        _progress *
                            (MediaQuery.of(context).size.height * 0.060),
                    child: Text(
                      _pokemonStore.currentPokemon.name,
                      style: TextStyle(
                          fontFamily: 'Google',
                          fontSize: 35 -
                              _progress *
                                  (MediaQuery.of(context).size.height * 0.011),
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  // Itens - Pokemon Types
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.19,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 20, top: 8, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            setTipos(_pokemonStore.currentPokemon.type),
                            Text(
                              '#' + _pokemonStore.currentPokemon.num.toString(),
                              style: TextStyle(
                                  fontFamily: 'Google',
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
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
              _opacityTitleAppBar = _multiple = interval(0.50, 0.86, _progress);
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
              child: AboutItem(),
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
                  _pokemonStore.setCurrentPokemon(index: index);
                  _pokeApiV2Store
                      .getInfoPokemon(_pokemonStore.currentPokemon.name);
                  _pokeApiV2Store.getInfoSpecie(
                      _pokemonStore.currentPokemon.id.toString());
                },
                itemCount: _pokemonStore.pokeAPI.pokemon.length,
                itemBuilder: (BuildContext context, int index) {
                  Pokemon _pokeItem = _pokemonStore.getPokemon(index: index);
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
                              opacity: index == _pokemonStore.currentPosition
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
                          name: 'Pokemon',
                          builder: (context) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                                      color:
                                          index == _pokemonStore.currentPosition
                                              ? null
                                              : Colors.black.withOpacity(0.5),
                                      imageUrl:
                                          'https://raw.githubusercontent.com/fanzeyi/pokemon.json/master/images/${_pokeItem.num}.png',
                                    ),
                                    tag: index == _pokemonStore.currentPosition
                                        ? _pokeItem.name
                                        : 'none' + index.toString(),
                                  ),
                                  duration: Duration(milliseconds: 400),
                                  curve: Curves.easeIn,
                                  padding: EdgeInsets.only(
                                    top: index == _pokemonStore.currentPosition
                                        ? 0
                                        : 60,
                                    bottom:
                                        index == _pokemonStore.currentPosition
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
      ]),
    );
  }

  //SetTipos
  Widget setTipos(List<String> types) {
    List<Widget> lista = [];
    types.forEach((nome) {
      lista.add(
        Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromARGB(80, 255, 255, 255)),
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Text(
                  nome.trim(),
                  style: TextStyle(
                      fontFamily: 'Google',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              width: 8,
            )
          ],
        ),
      );
    });
    return Row(
      children: lista,
      crossAxisAlignment: CrossAxisAlignment.start,
    );
  }
}
