import 'package:flutter_pokedex/app/modules/home_pokedex/domain/entity/pokemon_prev_evolution_entity.dart';
import 'package:flutter_pokedex/app/modules/home_pokedex/domain/entity/pokemon_next_evolution_entity.dart';

class PokemonEntity {
  int id;
  String number;
  String name;
  String img;
  List<String> type;
  String height;
  String weight;
  String candy;
  String egg;
  List<NextEvolutionEntity> nextEvolution;
  List<PrevEvolutionEntity> prevEvolution;

  PokemonEntity({
    this.id,
    this.number,
    this.name,
    this.img,
    this.type,
    this.height,
    this.weight,
    this.candy,
    this.egg,
    this.nextEvolution,
    this.prevEvolution,
  });
}
