import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_pokedex/app/constants/consts_api.dart';
import 'package:flutter_pokedex/app/core/errors/exceptions.dart';
import 'package:flutter_pokedex/app/core/httpClient/http_client.dart';
import 'package:flutter_pokedex/app/modules/home_pokedex/data/model/pokemon_list_model.dart';
import 'package:flutter_pokedex/app/modules/home_pokedex/data/datasource/pokedex_home_datasource.dart';

class HttpClientMock extends Mock implements IHttpClient {}

void main() {
  IHttpClient httpClient;
  IPokedexHomeDataSource pokedexHomeDataSource;

  setUp(() {
    httpClient = HttpClientMock();
    pokedexHomeDataSource = PokedexHomeDataSource(httpClient);
  });

  final json = """{
    "pokemon": [
      {
        "id": 2,
        "num": "002",
        "name": "Ivysaur",
        "img": "http://www.serebii.net/pokemongo/pokemon/002.png",
        "type": ["Grass", "Poison"],
        "height": "0.99 m",
        "weight": "13.0 kg",
        "candy": "Bulbasaur Candy",
        "egg": "Not in Eggs",
        "prev_evolution": [
          {"num": "001", "name": "Bulbasaur"}
        ],
        "next_evolution": [
          {"num": "003", "name": "Venusaur"}
        ]
      }
    ]
  }""";

  final url = ConstsApi.pokeApiUrl;

  void successMock() {
    when(() => httpClient.get(any())).thenAnswer(
      (_) async => HttpResponse(
        data: json,
        statusCode: 200,
      ),
    );
  }

  group('Get list pokemon datasource implementation.', () {
    test('Should call the get method with url', () async {
      // Arrange
      successMock();
      // Actual
      await pokedexHomeDataSource.getPokemons();
      // Assert
      verify(() => httpClient.get(url)).called(1);
    });

    test('Should return a pokemon list.', () async {
      // Arrange
      successMock();
      // Actual
      final result = await pokedexHomeDataSource.getPokemons();
      // Assert
      expect(result, isA<PokemonListModel>());
    });

    test('Should throw a ServerException when the call is successful.',
        () async {
      // Arrange
      when(() => httpClient.get(any())).thenAnswer(
        (_) async => HttpResponse(
          data: "",
          statusCode: 400,
        ),
      );
      // Actual
      final result = pokedexHomeDataSource.getPokemons();
      // Assert
      expect(() => result, throwsA(ServerException()));
    });
  });
}
