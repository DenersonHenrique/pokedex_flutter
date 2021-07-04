import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_pokedex/app/constants/consts_api.dart';
import 'package:flutter_pokedex/app/core/httpClient/http_client.dart';
import 'package:flutter_pokedex/app/modules/home_pokedex/data/datasource/pokedex_home_datasource.dart';

class HttpClientMock extends Mock implements IHttpClient {}

void main() {
  IHttpClient httpClient;
  IPokedexHomeDataSource pokedexHomeDataSource;

  setUp(() {
    httpClient = HttpClientMock();
    pokedexHomeDataSource = PokedexHomeDataSource(httpClient);
  });

  final url = ConstsApi.pokeApiUrl;

  group('Get list pokemon datasource implementation.', () {
    test('Should call the get method with url', () async {
      // Arrange
      when(() => httpClient.get(any())).thenAnswer(
        (_) async => HttpResponse(
          data: {},
          statusCode: 200,
        ),
      );
      // Actual
      await pokedexHomeDataSource.getPokemons();
      // Assert
      verify(() => httpClient.get(url)).called(1);
    });
  });
}
