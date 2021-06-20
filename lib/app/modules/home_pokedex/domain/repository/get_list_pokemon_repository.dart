import 'package:flutter_pokedex/app/modules/home_pokedex/domain/entity/pokemon_list_entity.dart';

abstract class IPokedexHomeRepository {
  Future<PokemonListEntity> getMyPokemons();
}
