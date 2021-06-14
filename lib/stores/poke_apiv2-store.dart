import 'dart:convert';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_pokedex/models/specie.dart';
import 'package:flutter_pokedex/models/pokeApiV2.dart';
import 'package:flutter_pokedex/app/constants/consts_api.dart';
part 'poke_apiv2-store.g.dart';

class PokeApiV2Store = _PokeApiV2StoreBase with _$PokeApiV2Store;

abstract class _PokeApiV2StoreBase with Store {
  @observable
  Specie specie;

  @observable
  PokeApiV2 pokeApiV2;

  @action
  Future<void> getInfoPokemon(int id) async {
    // Get Usecase here
    try {
      final response = await http.get(ConstsApi.pokeApiV2Url + id.toString());
      var decodeJson = jsonDecode(response.body);
      pokeApiV2 = PokeApiV2.fromJson(decodeJson);
    } catch (error) {
      print(error);
      return null;
    }
  }

  @action
  Future<void> getInfoSpecie(String numPokemon) async {
    try {
      final response =
          await http.get(ConstsApi.pokeApiV2SpeciesUrl + numPokemon);
      var decodeJson = jsonDecode(response.body);
      specie = Specie.fromJson(decodeJson);
    } catch (error) {
      print("Erro ao carregar list.");
      return null;
    }
  }
}
