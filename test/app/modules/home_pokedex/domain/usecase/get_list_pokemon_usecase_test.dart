import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_pokedex/app/core/errors/failures.dart';
import 'package:flutter_pokedex/app/modules/home_pokedex/domain/entity/pokemon_list_entity.dart';
import 'package:flutter_pokedex/app/modules/home_pokedex/domain/usecase/get_list_pokemon_usecase.dart';
import 'package:flutter_pokedex/app/modules/home_pokedex/domain/repository/get_list_pokemon_repository.dart';

class PokedexHomeRepositoryMock extends Mock implements IPokedexHomeRepository {
}

void main() {
  PokedexHomeRepositoryMock repository;
  GetListPokemonUsecase getListPokemonUsecase;
  final listPokemon = PokemonListEntity(pokemonListEntity: []);

  setUp(() {
    repository = PokedexHomeRepositoryMock();
    getListPokemonUsecase = GetListPokemonUsecase(repository);
  });

  group('Find all Pokemon list.', () {
    test('Should return pokemon entity list.', () async {
      // Arrange
      when(() => repository.getMyPokemons()).thenAnswer(
        (_) async => Right<Failure, PokemonListEntity>(listPokemon),
      );
      // Actual
      final result = await getListPokemonUsecase.getPokemonList();
      // Assert
      expect(result, Right(listPokemon));
      verify(() => repository.getMyPokemons()).called(1);
    });

    test('Should return a ServerFailure.', () async {
      // Arrange
      when(() => repository.getMyPokemons()).thenAnswer(
        (_) async => Left<Failure, PokemonListEntity>(ServerFailure()),
      );
      // Actual
      final result = await getListPokemonUsecase.getPokemonList();
      // Assert
      expect(result, Left(ServerFailure()));
      verify(() => repository.getMyPokemons()).called(1);
    });
  });
}
