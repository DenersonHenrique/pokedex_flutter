import 'package:flutter_pokedex/app/modules/home_pokedex/domain/entity/pokemon_model.dart';
import 'package:flutter_pokedex/app/modules/home_pokedex/data/datasource/pokedex_home_datasource.dart';
import 'package:flutter_pokedex/app/modules/home_pokedex/domain/repository/get_list_pokemon_repository.dart';

class PokedexHomeRepository implements IPokedexHomeRepository {
  final PokedexHomeDataSource _pokedexHomeDataSource;

  PokedexHomeRepository(
    this._pokedexHomeDataSource,
  );

  @override
  Future<List<Pokemon>> getMyPokemons() async {
    final response = await _pokedexHomeDataSource.getPokemons();
    return response;
  }
}
