import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_pokedex/app/core/errors/failures.dart';
import 'package:flutter_pokedex/app/modules/poke_detail/domain/entity/pokemon_detail_entity.dart';
import 'package:flutter_pokedex/app/modules/poke_detail/domain/usecase/get_info_pokemon_by_id_usecase.dart';
import 'package:flutter_pokedex/app/modules/poke_detail/domain/repository/get_info_pokemon_repository.dart';

class PokemonInfoRepositoryMock extends Mock implements IPokemonInfoRepository {
}

void main() {
  PokemonInfoRepositoryMock repository;
  GetInfoPokemonByIdUsecase getInfoPokemonUsecase;
  final pokemonDetailEntity = PokemonDetailEntity();

  setUp(() {
    repository = PokemonInfoRepositoryMock();
    getInfoPokemonUsecase = GetInfoPokemonByIdUsecase(repository);
  });

  group('Find pokemon information.', () {
    test('Find Pokemon detail by id.', () async {
      // Arrange
      when(() => repository.getInfoPokemonById(any())).thenAnswer(
        (_) async => Right<Failure, PokemonDetailEntity>(pokemonDetailEntity),
      );
      // Actual
      final result = await getInfoPokemonUsecase.getInfoPokemonById(0);
      // Assert
      expect(result, Right(pokemonDetailEntity));
      verify(() => repository.getInfoPokemonById(0)).called(1);
    });

    test('Should return a ServerFailure', () async {
      // Assert
      when(() => repository.getInfoPokemonById(any())).thenAnswer(
        (_) async => Left<Failure, PokemonDetailEntity>(ServerFailure()),
      );
      // Actual
      final result = await getInfoPokemonUsecase.getInfoPokemonById(0);
      // Assert
      expect(result, Left(ServerFailure()));
      verify(() => repository.getInfoPokemonById(0)).called(1);
    });
  });
}
