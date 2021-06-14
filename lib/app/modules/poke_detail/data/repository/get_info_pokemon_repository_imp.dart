import 'package:flutter_pokedex/app/modules/poke_detail/data/datasource/pokemon_info_datasource.dart';
import 'package:flutter_pokedex/app/modules/poke_detail/domain/entity/pokemon_detail_entity.dart';
import 'package:flutter_pokedex/app/modules/poke_detail/domain/repository/get_info_pokemon_repository.dart';

class PokemonInfoRepository implements IPokemonInfoRepository {
  final PokemonInfoDataSource _pokemonInfoDataSource;

  PokemonInfoRepository(
    this._pokemonInfoDataSource,
  );

  @override
  Future<PokemonDetailEntity> getInfoPokemon(int id) async {
    final response = await _pokemonInfoDataSource.getInfoPokemon(id);
    return response;
  }
}
