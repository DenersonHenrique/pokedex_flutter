import 'package:flutter_pokedex/app/modules/poke_detail/domain/entity/pokemon_detail_entity.dart';
import 'package:flutter_pokedex/app/modules/poke_detail/domain/repository/get_info_pokemon_repository.dart';

abstract class IGetInfoPokemonUsecase {
  Future<PokemonDetailEntity> getInfoPokemon(int id);
}

class GetInfoPokemonUsecase implements IGetInfoPokemonUsecase {
  IPokemonInfoRepository pokemonInfoRepository;

  GetInfoPokemonUsecase(
    this.pokemonInfoRepository,
  );

  @override
  Future<PokemonDetailEntity> getInfoPokemon(int id) async =>
      await pokemonInfoRepository.getInfoPokemon(id);
}
