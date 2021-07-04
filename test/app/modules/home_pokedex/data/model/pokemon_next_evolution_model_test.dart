import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_pokedex/app/modules/home_pokedex/data/model/pokemon_next_evolution_model.dart';
import 'package:flutter_pokedex/app/modules/home_pokedex/domain/entity/pokemon_next_evolution_entity.dart';

void main() {
  final json = <String, dynamic>{"num": "003", "name": "Venusaur"};

  final nextEvolutionModel = NextEvolutionModel.fromJson(json);

  test('Should be an instance of NextEvolutionEntity', () {
    expect(nextEvolutionModel, isA<NextEvolutionEntity>());
  });

  test('Should be a valid NextEvolutionModel', () {
    final result = NextEvolutionModel.fromJson(json);
    expect(result, isA<NextEvolutionEntity>());
  });

  test('Should return a Json', () {
    final resultJson = nextEvolutionModel.toJson();
    expect(resultJson, json);
  });
}
