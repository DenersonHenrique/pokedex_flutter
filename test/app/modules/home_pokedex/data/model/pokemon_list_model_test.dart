import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_pokedex/app/modules/home_pokedex/data/model/pokemon_list_model.dart';
import 'package:flutter_pokedex/app/modules/home_pokedex/domain/entity/pokemon_list_entity.dart';

void main() {
  final json = <String, dynamic>{
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
  };

  final pokemonListModel = PokemonListModel.fromJson(json);

  test('Should be an instance of PokemonListEntity', () {
    expect(pokemonListModel, isA<PokemonListEntity>());
  });

  test('Should be a valid PokemonListModel', () {
    final result = PokemonListModel.fromJson(json);
    expect(result, isA<PokemonListEntity>());
  });

  test('Should return a Json', () {
    final resultJson = pokemonListModel.toJson();
    expect(resultJson, json);
  });
}
