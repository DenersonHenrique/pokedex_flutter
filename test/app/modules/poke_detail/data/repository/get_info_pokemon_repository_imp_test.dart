import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_pokedex/app/core/errors/failures.dart';
import 'package:flutter_pokedex/app/modules/poke_detail/data/model/pokemon_detail_model.dart';
import 'package:flutter_pokedex/app/modules/poke_detail/data/datasource/pokemon_info_datasource.dart';
import 'package:flutter_pokedex/app/modules/poke_detail/data/repository/get_info_pokemon_repository_imp.dart';

class PokemonInfoDataSourceMock extends Mock implements IPokemonInfoDataSource {
}

void main() {
  PokemonInfoRepository repository;
  IPokemonInfoDataSource pokemonInfoDataSource;

  setUp(() {
    pokemonInfoDataSource = PokemonInfoDataSourceMock();
    repository = PokemonInfoRepository(pokemonInfoDataSource);
  });

  final pokemonDetailModel = PokemonDetailModel();

  group('Get info Pokemon repository implementation', () {
    test('Should return model Pokemon model', () async {
      // Arrange
      when(
        () => pokemonInfoDataSource.getInfoPokemon(any()),
      ).thenAnswer((_) async => pokemonDetailModel);
      // Actual
      final result = await repository.getInfoPokemonById(0);
      // Assert
      expect(result, Right(pokemonDetailModel));
      verify(() => pokemonInfoDataSource.getInfoPokemon(0)).called(1);
    });

    test('Should return a server failure when call datasource', () async {
      // Arrange
      when(
        () => pokemonInfoDataSource.getInfoPokemon(any()),
      ).thenThrow((_) async => Exception());
      // Actual
      final result = await repository.getInfoPokemonById(0);
      // Assert
      expect(result, Left(ServerFailure()));
      verify(() => pokemonInfoDataSource.getInfoPokemon(0)).called(1);
    });
  });
}
