import 'package:flutter_pokedex/app/modules/home_pokedex/domain/entity/pokemon_model.dart';
import 'package:flutter_pokedex/app/modules/home_pokedex/domain/repository/get_list_pokemon_repository.dart';

abstract class IGetListPokemonUsecase {
  Future<List<Pokemon>> getPokemonList();
}

class GetListPokemonUsecase implements IGetListPokemonUsecase {
  IPokedexHomeRepository pokedexHomeRepository;

  GetListPokemonUsecase(
    this.pokedexHomeRepository,
  );

  Future<List<Pokemon>> getPokemonList() async =>
      pokedexHomeRepository.getMyPokemons();
}
