import 'dart:convert';
import 'package:flutter_pokedex/app/constants/consts_api.dart';
import 'package:flutter_pokedex/app/core/errors/exceptions.dart';
import 'package:flutter_pokedex/app/core/httpClient/http_client.dart';
import 'package:flutter_pokedex/app/modules/home_pokedex/data/model/pokemon_list_model.dart';

abstract class IPokedexHomeDataSource {
  Future<PokemonListModel> getPokemons();
}

class PokedexHomeDataSource extends IPokedexHomeDataSource {
  final IHttpClient client;

  PokedexHomeDataSource(this.client);

  Future<PokemonListModel> getPokemons() async {
    try {
      final response = await client.get(ConstsApi.pokeApiUrl);
      return PokemonListModel.fromJson(jsonDecode(response.data));
    } on ServerException catch (error) {
      throw ServerException();
    }
  }
}
