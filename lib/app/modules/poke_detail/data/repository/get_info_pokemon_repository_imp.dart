import 'package:dartz/dartz.dart';
import 'package:flutter_pokedex/app/core/errors/failures.dart';
import 'package:flutter_pokedex/app/modules/poke_detail/domain/entity/pokemon_detail_entity.dart';
import 'package:flutter_pokedex/app/modules/poke_detail/data/datasource/pokemon_info_datasource.dart';
import 'package:flutter_pokedex/app/modules/poke_detail/domain/repository/get_info_pokemon_repository.dart';

class PokemonInfoRepository implements IPokemonInfoRepository {
  final IPokemonInfoDataSource _pokemonInfoDataSource;

  PokemonInfoRepository(
    this._pokemonInfoDataSource,
  );

  @override
  Future<Either<Failure, PokemonDetailEntity>> getInfoPokemonById(
    int id,
  ) async {
    try {
      final response = await _pokemonInfoDataSource.getInfoPokemon(id);
      return Right(response);
    } on ServerFailure catch (error) {
      return Left(error);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
