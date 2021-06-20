import 'package:mobx/mobx.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pokedex/app/constants/consts_app.dart';
import 'package:flutter_pokedex/app/modules/home_pokedex/domain/entity/pokemon_entity.dart';
import 'package:flutter_pokedex/app/modules/home_pokedex/domain/entity/pokemon_list_entity.dart';
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
  PokemonListEntity _pokemonList;

  @computed
  PokemonListEntity get pokemonList => _pokemonList;

  @observable
  PokemonEntity _currentPokemon;

  @computed
  PokemonEntity get currentPokemon => _currentPokemon;

  @observable
  Color _pokeColor;

  @computed
  Color get pokeColor => _pokeColor;

  @observable
  int currentPosition;

  PokemonEntity getPokemon({int index}) {
    return _pokemonList.pokemonListEntity[index];
  }

  @action
  fetchPokemonList() async {
    _pokemonList = null;
    _pokemonList = await _getListPokemonUsecase.getPokemonList();
  }

  @action
  setCurrentPokemon({int index}) {
    _currentPokemon = _pokemonList.pokemonListEntity[index];
    _pokeColor = ConstsApp.getColorType(type: _currentPokemon.type[0]);
    currentPosition = index;
  }
}
