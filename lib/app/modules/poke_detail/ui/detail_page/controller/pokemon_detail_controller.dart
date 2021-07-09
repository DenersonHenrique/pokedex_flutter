import 'dart:convert';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_pokedex/app/common/models/specie.dart';
import 'package:flutter_pokedex/app/constants/consts_api.dart';
import 'package:flutter_pokedex/app/modules/poke_detail/domain/entity/pokemon_detail_entity.dart';
import 'package:flutter_pokedex/app/modules/poke_detail/domain/usecase/get_info_pokemon_by_id_usecase.dart';
part 'pokemon_detail_controller.g.dart';

class PokemonDetailController = _PokemonDetailControllerBase
    with _$PokemonDetailController;

abstract class _PokemonDetailControllerBase with Store {
  final GetInfoPokemonByIdUsecase _getInfoPokemonByIdUsecase;

  _PokemonDetailControllerBase({
    GetInfoPokemonByIdUsecase getInfoPokemonByIdUsecase,
  }) : _getInfoPokemonByIdUsecase = getInfoPokemonByIdUsecase;

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
    _pokemonDetailEntity = null;
    final result = await _getInfoPokemonByIdUsecase.getInfoPokemonById(id);
    result.fold(
      (l) => null,
      (r) => _pokemonDetailEntity = r,
    );
  }

  @action
  Future<void> getInfoSpecie(String numPokemon) async {
    try {
      final response = await http.get(
        Uri.parse(ConstsApi.pokeApiSpeciesUrl + numPokemon),
      );
      var decodeJson = jsonDecode(response.body);
      _specie = Specie.fromJson(decodeJson);
    } catch (error) {
      print("Erro ao carregar list.");
      return null;
    }
  }
}
