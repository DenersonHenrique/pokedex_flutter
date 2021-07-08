import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_pokedex/app/modules/home_pokedex/data/model/pokemon_model.dart';
import 'package:flutter_pokedex/app/modules/home_pokedex/domain/entity/pokemon_entity.dart';

void main() {
  final json = <String, dynamic>{
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
  };

  final pokemonModel = PokemonModel.fromJson(json);

  test('Should be an instance of PokemonEntity', () {
    expect(pokemonModel, isA<PokemonEntity>());
  });

  test('Should be a valid PokemonModel', () {
    final result = PokemonModel.fromJson(json);
    expect(result, isA<PokemonEntity>());
  });

  test('Should return a Json', () {
    final resultJson = pokemonModel.toJson();
    expect(resultJson, json);
  });
}
