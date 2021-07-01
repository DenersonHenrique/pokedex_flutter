import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_pokedex/app/modules/home_pokedex/domain/repository/get_list_pokemon_repository.dart';

class PokedexHomeRepositoryMock extends Mock implements IPokedexHomeRepository {
}

void main() {
  PokedexHomeRepositoryMock _repository;
}
