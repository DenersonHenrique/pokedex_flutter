import 'package:dartz/dartz.dart';
import 'package:flutter_pokedex/app/core/errors/failures.dart';
import 'package:flutter_pokedex/app/modules/home_pokedex/domain/entity/pokemon_list_entity.dart';
import 'package:flutter_pokedex/app/modules/home_pokedex/data/datasource/pokedex_home_datasource.dart';
import 'package:flutter_pokedex/app/modules/home_pokedex/domain/repository/get_list_pokemon_repository.dart';

class PokedexHomeRepository implements IPokedexHomeRepository {
  final IPokedexHomeDataSource _pokedexHomeDataSource;

  PokedexHomeRepository(
    this._pokedexHomeDataSource,
  );

  @override
  Future<Either<Failure, PokemonListEntity>> getMyPokemons() async {
    try {
      final response = await _pokedexHomeDataSource.getPokemons();
      return Right(response);
    } on ServerFailure catch (error) {
      return Left(error);
    } catch (error) {
      return Left(ServerFailure());
    }
  }
}
