import 'package:flutter_pokedex/app/modules/poke_detail/domain/entity/move_entity.dart';
import 'package:flutter_pokedex/app/modules/poke_detail/domain/entity/stat_entity.dart';
import 'package:flutter_pokedex/app/modules/poke_detail/domain/entity/type_entity.dart';
import 'package:flutter_pokedex/app/modules/poke_detail/domain/entity/ability_entity.dart';
import 'package:flutter_pokedex/app/modules/poke_detail/domain/entity/game_indice_entity.dart';

class PokemonDetailEntity {
  List<AbilitiesEntity> abilities;
  int baseExperience;
  List<GameIndicesEntity> gameIndices;
  int height;
  int id;
  bool isDefault;
  String locationAreaEncounters;
  List<MoveEntity> moves;
  String name;
  int order;
  AbilityEntity species;
  List<StatEntity> stats;
  List<TypeEntity> types;
  int weight;

  PokemonDetailEntity({
    this.abilities,
    this.baseExperience,
    this.gameIndices,
    this.height,
    this.id,
    this.isDefault,
    this.locationAreaEncounters,
    this.moves,
    this.name,
    this.order,
    this.species,
    this.stats,
    this.types,
    this.weight,
  });
}
