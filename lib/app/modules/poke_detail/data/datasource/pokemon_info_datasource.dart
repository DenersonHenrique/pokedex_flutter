import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_pokedex/app/constants/consts_api.dart';
import 'package:flutter_pokedex/app/modules/poke_detail/data/model/pokemon_detail_model.dart';

class PokemonInfoDataSource {
  Future getInfoPokemon(int id) async {
    try {
      final response = await http.get(
        ConstsApi.pokeApiDetailUrl + id.toString(),
      );
      var decodeJson = jsonDecode(response.body);
      return PokemonDetailModel.fromJson(decodeJson);
    } catch (error) {
      print(error);
      return null;
    }
  }
}
