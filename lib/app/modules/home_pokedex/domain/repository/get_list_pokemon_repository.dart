import 'package:dartz/dartz.dart';
import 'package:flutter_pokedex/app/core/errors/failures.dart';
import 'package:flutter_pokedex/app/modules/home_pokedex/domain/entity/pokemon_list_entity.dart';

abstract class IPokedexHomeRepository {
  Future<Either<Failure, PokemonListEntity>> getMyPokemons();
}
