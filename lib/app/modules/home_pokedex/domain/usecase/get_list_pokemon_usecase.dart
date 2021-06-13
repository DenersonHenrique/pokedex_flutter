import 'package:flutter_pokedex/app/modules/home_pokedex/domain/entity/pokemon_list_entity.dart';
import 'package:flutter_pokedex/app/modules/home_pokedex/domain/repository/get_list_pokemon_repository.dart';

abstract class IGetListPokemonUsecase {
  Future<PokemonListEntity> getPokemonList();
}

class GetListPokemonUsecase implements IGetListPokemonUsecase {
  IPokedexHomeRepository pokedexHomeRepository;

  GetListPokemonUsecase(
    this.pokedexHomeRepository,
  );

  Future<PokemonListEntity> getPokemonList() async =>
      await pokedexHomeRepository.getMyPokemons();
}
