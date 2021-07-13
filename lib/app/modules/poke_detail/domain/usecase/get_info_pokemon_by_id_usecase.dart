import 'package:dartz/dartz.dart';
import 'package:flutter_pokedex/app/core/errors/failures.dart';
import 'package:flutter_pokedex/app/modules/poke_detail/domain/entity/pokemon_detail_entity.dart';
import 'package:flutter_pokedex/app/modules/poke_detail/domain/repository/get_info_pokemon_repository.dart';

abstract class IGetInfoPokemonByIdUsecase {
  Future<Either<Failure, PokemonDetailEntity>> getInfoPokemonById(int id);
}

class GetInfoPokemonByIdUsecase implements IGetInfoPokemonByIdUsecase {
  IPokemonInfoRepository pokemonInfoRepository;

  GetInfoPokemonByIdUsecase(
    this.pokemonInfoRepository,
  );

  @override
  Future<Either<Failure, PokemonDetailEntity>> getInfoPokemonById(
    int id,
  ) async =>
      await pokemonInfoRepository.getInfoPokemonById(id);
}
