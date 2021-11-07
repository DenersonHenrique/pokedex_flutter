import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_pokedex/app/core/errors/failures.dart';
import 'package:flutter_pokedex/app/modules/home_pokedex/data/model/pokemon_list_model.dart';
import 'package:flutter_pokedex/app/modules/home_pokedex/data/datasource/pokedex_home_datasource.dart';
import 'package:flutter_pokedex/app/modules/home_pokedex/data/repository/get_list_pokemon_repository_imp.dart';

class PokedexHomeDataSourceMock extends Mock implements IPokedexHomeDataSource {
}

void main() {
  PokedexHomeRepository repository;
  IPokedexHomeDataSource pokedexHomeDataSource;

  setUp(() {
    pokedexHomeDataSource = PokedexHomeDataSourceMock();
    repository = PokedexHomeRepository(pokedexHomeDataSource);
  });

  final pokemonListModel = PokemonListModel(pokemonListEntity: []);

  group('Get list pokemon repository implementation.', () {
    test('Should return list pokemon model.', () async {
      // Arrange
      when(() => pokedexHomeDataSource.getPokemons())
          .thenAnswer((_) async => pokemonListModel);
      // Actual
      final result = await repository.getMyPokemons();
      // Assert
      expect(result, Right(pokemonListModel));
      verify(() => pokedexHomeDataSource.getPokemons()).called(1);
    });

    test('Should return a server failure when call datasource.', () async {
      // Arrange
      when(() => pokedexHomeDataSource.getPokemons()).thenThrow(Exception());
      // Actual
      final result = await repository.getMyPokemons();
      // Assert
      expect(result, Left(ServerFailure()));
      verify(() => pokedexHomeDataSource.getPokemons()).called(1);
    });
  });
}
