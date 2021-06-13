import 'package:flutter_pokedex/app/modules/home_pokedex/domain/entity/pokemon_list_entity.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pokedex/models/pokeApi.dart';
import 'package:flutter_pokedex/app/constants/consts_app.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_pokedex/app/modules/home_pokedex/domain/usecase/get_list_pokemon_usecase.dart';
part 'pokedex_home_controller.g.dart';

class PokedexHomeController = _PokedexHomeControllerBase
    with _$PokedexHomeController;

abstract class _PokedexHomeControllerBase with Store {
  final GetListPokemonUsecase _getListPokemonUsecase;

  _PokedexHomeControllerBase({
    GetListPokemonUsecase getListPokemonUsecase,
  }) : _getListPokemonUsecase = getListPokemonUsecase;

  @observable
  PokeApi _pokeAPI;

  @observable
  PokemonListEntity _pokemonList;

  @observable
  Pokemon _currentPokemon;

  @observable
  Color pokeColor;

  @observable
  int currentPosition;

  @computed
  PokeApi get pokeAPI => _pokeAPI;

  @computed
  Pokemon get currentPokemon => _currentPokemon;

  @action
  fetchPokemonList() async {
    _pokeAPI = null;
    _pokemonList = await _getListPokemonUsecase.getPokemonList();
    print(_pokemonList);

    // loadPokeAPI().then((pokeList) {
    //   _pokeAPI = pokeList;
    // });
  }

  Pokemon getPokemon({int index}) {
    return _pokeAPI.pokemon[index];
  }

  @action
  setCurrentPokemon({int index}) {
    _currentPokemon = _pokeAPI.pokemon[index];
    pokeColor = ConstsApp.getColorType(type: _currentPokemon.type[0]);
    currentPosition = index;
  }

  @action
  Widget getImage({String numero}) {
    return CachedNetworkImage(
      placeholder: (context, url) => new Container(
        color: Colors.transparent,
      ),
      imageUrl:
          'https://raw.githubusercontent.com/fanzeyi/pokemon.json/master/images/$numero.png',
    );
  }
}
