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

  @observable
  double _progress = 0;

  @computed
  double get getProgress => _progress;

  @action
  void setProgress(double progress) => _progress = progress;

  @observable
  double _opacity = 1;

  @computed
  double get getOpacity => _opacity;

  @action
  void setOpacity(double opacity) => _opacity = opacity;

  @observable
  double _multiple = 1;

  @computed
  double get getMultiple => _multiple;

  @action
  void setMultiple(double multiple) => _multiple = multiple;

  @observable
  double _opacityTitleAppBar = 0;

  @computed
  double get getOpacityTitleAppBar => _opacityTitleAppBar;

  @action
  void setOpacityTitleAppBar(double opacityTitleAppBar) =>
      _opacityTitleAppBar = opacityTitleAppBar;

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

  @action
  setSlidingSheet(double stateProgress) {
    setProgress(stateProgress);
    var multiple = 1 -
        interval(
          0.50,
          0.86,
          getProgress,
        );
    setMultiple(multiple);
    setOpacity(
      getMultiple,
    );
    _opacityTitleAppBar = interval(
      0.50,
      0.86,
      getProgress,
    );
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
}
