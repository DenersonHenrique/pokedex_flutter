import 'package:flutter_pokedex/app/modules/home_pokedex/domain/entity/pokemon_list_entity.dart';
import 'package:flutter_pokedex/app/modules/home_pokedex/data/datasource/pokedex_home_datasource.dart';
import 'package:flutter_pokedex/app/modules/home_pokedex/domain/repository/get_list_pokemon_repository.dart';

class PokedexHomeRepository implements IPokedexHomeRepository {
  final PokedexHomeDataSource _pokedexHomeDataSource;

  PokedexHomeRepository(
    this._pokedexHomeDataSource,
  );

  @override
  Future<PokemonListEntity> getMyPokemons() async {
    final response = await _pokedexHomeDataSource.getPokemons();
    return response;
  }
}
