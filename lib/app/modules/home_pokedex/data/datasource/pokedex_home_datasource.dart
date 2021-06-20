import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_pokedex/app/constants/consts_api.dart';
import 'package:flutter_pokedex/app/modules/home_pokedex/data/model/pokemon_list_model.dart';

class PokedexHomeDataSource {
  Future getPokemons() async {
    try {
      final response = await http.get(ConstsApi.pokeApiUrl);
      var decodeJson = jsonDecode(response.body);
      return PokemonListModel.fromJson(decodeJson);
    } catch (error) {
      print("Erro ao carregar list. $error");
      return null;
    }
  }
}
