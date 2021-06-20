import 'dart:convert';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_pokedex/models/specie.dart';
import 'package:flutter_pokedex/app/constants/consts_api.dart';
import 'package:flutter_pokedex/app/modules/poke_detail/domain/entity/pokemon_detail_entity.dart';
import 'package:flutter_pokedex/app/modules/poke_detail/domain/usecase/get_info_pokemon_usecase.dart';
part 'pokemon_detail_controller.g.dart';

class PokemonDetailController = _PokemonDetailControllerBase
    with _$PokemonDetailController;

abstract class _PokemonDetailControllerBase with Store {
  final GetInfoPokemonUsecase _getInfoPokemonUsecase;

  _PokemonDetailControllerBase({
    GetInfoPokemonUsecase getInfoPokemonUsecase,
  }) : _getInfoPokemonUsecase = getInfoPokemonUsecase;

  @observable
  Specie _specie;

  @computed
  Specie get specie => _specie;

  @observable
  PokemonDetailEntity _pokemonDetailEntity;

  @computed
  PokemonDetailEntity get pokemonDetailEntity => _pokemonDetailEntity;

  @action
  Future<void> getInfoPokemon(int id) async {
    _pokemonDetailEntity = await _getInfoPokemonUsecase.getInfoPokemon(id);
  }

  @action
  Future<void> getInfoSpecie(String numPokemon) async {
    try {
      final response = await http.get(ConstsApi.pokeApiSpeciesUrl + numPokemon);
      var decodeJson = jsonDecode(response.body);
      _specie = Specie.fromJson(decodeJson);
    } catch (error) {
      print("Erro ao carregar list.");
      return null;
    }
  }
}
