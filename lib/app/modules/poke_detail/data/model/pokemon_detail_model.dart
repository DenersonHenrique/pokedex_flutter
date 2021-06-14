import 'package:flutter_pokedex/app/modules/poke_detail/data/model/move_model.dart';
import 'package:flutter_pokedex/app/modules/poke_detail/data/model/stat_model.dart';
import 'package:flutter_pokedex/app/modules/poke_detail/data/model/type_model.dart';
import 'package:flutter_pokedex/app/modules/poke_detail/data/model/ability_model.dart';
import 'package:flutter_pokedex/app/modules/poke_detail/data/model/game_indice_model.dart';
import 'package:flutter_pokedex/app/modules/poke_detail/domain/entity/pokemon_detail_entity.dart';

class PokemonDetailModel extends PokemonDetailEntity {
  PokemonDetailModel({
    List<AbilitiesModel> abilities,
    int baseExperience,
    List<GameIndicesModel> gameIndices,
    int height,
    List<Null> heldItems,
    int id,
    bool isDefault,
    String locationAreaEncounters,
    List<MoveModel> moves,
    String name,
    int order,
    AbilityModel species,
    List<StatModel> stats,
    List<TypeModel> types,
    int weight,
  }) : super(
          abilities: abilities,
          baseExperience: baseExperience,
          gameIndices: gameIndices,
          height: height,
          heldItems: heldItems,
          id: id,
          isDefault: isDefault,
          locationAreaEncounters: locationAreaEncounters,
          moves: moves,
          name: name,
          order: order,
          species: species,
          stats: stats,
          types: types,
          weight: weight,
        );

  PokemonDetailModel.fromJson(Map<String, dynamic> json) {
    if (json['abilities'] != null) {
      abilities = <AbilitiesModel>[];
      json['abilities'].forEach((v) {
        abilities.add(new AbilitiesModel.fromJson(v));
      });
    }
    baseExperience = json['base_experience'];
    if (json['game_indices'] != null) {
      gameIndices = <GameIndicesModel>[];
      json['game_indices'].forEach((v) {
        gameIndices.add(new GameIndicesModel.fromJson(v));
      });
    }
    height = json['height'];
    id = json['id'];
    isDefault = json['is_default'];
    locationAreaEncounters = json['location_area_encounters'];
    if (json['moves'] != null) {
      moves = <MoveModel>[];
      json['moves'].forEach((v) {
        moves.add(new MoveModel.fromJson(v));
      });
    }
    name = json['name'];
    order = json['order'];
    species = json['species'] != null
        ? new AbilityModel.fromJson(json['species'])
        : null;
    if (json['stats'] != null) {
      stats = <StatModel>[];
      json['stats'].forEach((v) {
        stats.add(new StatModel.fromJson(v));
      });
    }
    if (json['types'] != null) {
      types = <TypeModel>[];
      json['types'].forEach((v) {
        types.add(new TypeModel.fromJson(v));
      });
    }
    weight = json['weight'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.abilities != null) {
      data['abilities'] =
          this.abilities.map((v) => (v as AbilitiesModel).toJson()).toList();
    }
    data['base_experience'] = this.baseExperience;
    if (this.gameIndices != null) {
      data['game_indices'] = this
          .gameIndices
          .map((v) => (v as GameIndicesModel).toJson())
          .toList();
    }
    data['height'] = this.height;
    data['id'] = this.id;
    data['is_default'] = this.isDefault;
    data['location_area_encounters'] = this.locationAreaEncounters;
    if (this.moves != null) {
      data['moves'] = this.moves.map((v) => (v as MoveModel).toJson()).toList();
    }
    data['name'] = this.name;
    data['order'] = this.order;
    if (this.species != null) {
      data['species'] = this.species; // Atention point.
    }
    if (this.stats != null) {
      data['stats'] = this.stats.map((v) => (v as StatModel).toJson()).toList();
    }
    if (this.types != null) {
      data['types'] = this.types.map((v) => (v as TypeModel).toJson()).toList();
    }
    data['weight'] = this.weight;
    return data;
  }
}
