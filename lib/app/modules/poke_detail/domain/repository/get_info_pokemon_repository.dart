import 'package:dartz/dartz.dart';
import 'package:flutter_pokedex/app/core/errors/failures.dart';
import 'package:flutter_pokedex/app/modules/poke_detail/domain/entity/pokemon_detail_entity.dart';

abstract class IPokemonInfoRepository {
  Future<Either<Failure, PokemonDetailEntity>> getInfoPokemonById(int id);
}
