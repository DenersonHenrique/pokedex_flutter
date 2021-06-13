import 'dart:convert';
import 'package:mobx/mobx.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_pokedex/models/pokeApi.dart';
import 'package:flutter_pokedex/app/constants/consts_api.dart';
import 'package:flutter_pokedex/app/constants/consts_app.dart';
import 'package:cached_network_image/cached_network_image.dart';
part 'poke_api-store.g.dart';

class PokeApiStore = _PokeApiStoreBase with _$PokeApiStore;

abstract class _PokeApiStoreBase with Store {
  @observable
  PokeApi _pokeAPI;

  @observable
  Pokemon _currentPokemon;

  @observable
  Color pokeColor;

  @observable
  int currentPosition;

  @computed
  PokeApi get pokeAPI => _pokeAPI;

  @computed
  Pokemon get currentPokemon => _currentPokemon;

  @action
  fetchPokemonList() {
    _pokeAPI = null;
    loadPokeAPI().then((pokeList) {
      _pokeAPI = pokeList;
    });
  }

  Pokemon getPokemon({int index}) {
    return _pokeAPI.pokemon[index];
  }

  @action
  setCurrentPokemon({int index}) {
    _currentPokemon = _pokeAPI.pokemon[index];
    pokeColor = ConstsApp.getColorType(type: _currentPokemon.type[0]);
    currentPosition = index;
  }

  @action
  Widget getImage({String numero}) {
    return CachedNetworkImage(
      placeholder: (context, url) => new Container(
        color: Colors.transparent,
      ),
      imageUrl:
          'https://raw.githubusercontent.com/fanzeyi/pokemon.json/master/images/$numero.png',
    );
  }

  Future<PokeApi> loadPokeAPI() async {
    try {
      final response = await http.get(ConstsApi.pokeApiUrl);
      var decodeJson = jsonDecode(response.body);
      return PokeApi.fromJson(decodeJson);
    } catch (error) {
      print("Erro ao carregar list. $error");
      return null;
    }
  }
}
