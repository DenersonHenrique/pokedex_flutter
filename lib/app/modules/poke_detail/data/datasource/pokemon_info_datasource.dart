import 'dart:convert';
import 'package:flutter_pokedex/app/constants/consts_api.dart';
import 'package:flutter_pokedex/app/core/errors/exceptions.dart';
import 'package:flutter_pokedex/app/core/httpClient/http_client.dart';
import 'package:flutter_pokedex/app/modules/poke_detail/data/model/pokemon_detail_model.dart';

abstract class IPokemonInfoDataSource {
  Future<PokemonDetailModel> getInfoPokemon(int id);
}

class PokemonInfoDataSource extends IPokemonInfoDataSource {
  final IHttpClient client;

  PokemonInfoDataSource(this.client);

  Future<PokemonDetailModel> getInfoPokemon(int id) async {
    final response = await client.get(
      Uri.parse(
        ConstsApi.pokeApiDetailUrl + id.toString(),
      ).toString(),
    );

    if (response.statusCode == 200) {
      return PokemonDetailModel.fromJson(jsonDecode(response.data));
    } else {
      throw ServerException();
    }
  }
}
