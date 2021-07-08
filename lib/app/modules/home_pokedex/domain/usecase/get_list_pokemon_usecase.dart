import 'package:dartz/dartz.dart';
import 'package:flutter_pokedex/app/core/errors/failures.dart';
import 'package:flutter_pokedex/app/modules/home_pokedex/domain/entity/pokemon_list_entity.dart';
import 'package:flutter_pokedex/app/modules/home_pokedex/domain/repository/get_list_pokemon_repository.dart';

abstract class IGetListPokemonUsecase {
  Future<Either<Failure, PokemonListEntity>> getPokemonList();
}

class GetListPokemonUsecase implements IGetListPokemonUsecase {
  final IPokedexHomeRepository _pokedexHomeRepository;

  GetListPokemonUsecase(
    this._pokedexHomeRepository,
  );

  Future<Either<Failure, PokemonListEntity>> getPokemonList() async =>
      await _pokedexHomeRepository.getMyPokemons();
}
