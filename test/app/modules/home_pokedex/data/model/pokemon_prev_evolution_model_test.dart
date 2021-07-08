import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_pokedex/app/modules/home_pokedex/data/model/pokemon_prev_evolution_model.dart';
import 'package:flutter_pokedex/app/modules/home_pokedex/domain/entity/pokemon_prev_evolution_entity.dart';

void main() {
  final json = <String, dynamic>{"num": "001", "name": "Bulbasaur"};

  final prevEvolutionModel = PrevEvolutionModel.fromJson(json);

  test('Should be an instance of PrevEvolutionEntity', () {
    expect(prevEvolutionModel, isA<PrevEvolutionEntity>());
  });

  test('Should be a valid PrevEvolutionModel', () {
    final result = PrevEvolutionModel.fromJson(json);
    expect(result, isA<PrevEvolutionEntity>());
  });

  test('Should return a Json', () {
    final resultJson = prevEvolutionModel.toJson();
    expect(resultJson, json);
  });
}
