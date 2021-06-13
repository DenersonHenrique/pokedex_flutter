import 'package:flutter_pokedex/app/modules/home_pokedex/domain/entity/pokemon_model.dart';

abstract class IPokedexHomeRepository {
  Future<List<Pokemon>> getMyPokemons();
}
