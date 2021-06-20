import 'package:flutter_pokedex/app/modules/home_pokedex/data/model/pokemon_model.dart';
import 'package:flutter_pokedex/app/modules/home_pokedex/domain/entity/pokemon_list_entity.dart';

class PokemonListModel extends PokemonListEntity {
  PokemonListModel({
    List<PokemonModel> pokemonListEntity,
  }) : super(
          pokemonListEntity: pokemonListEntity,
        );

  PokemonListModel.fromJson(Map<String, dynamic> json) {
    if (json['pokemon'] != null) {
      pokemonListEntity = <PokemonModel>[];
      json['pokemon'].forEach((v) {
        pokemonListEntity.add(new PokemonModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.pokemonListEntity != null) {
      data['pokemon'] = this
          .pokemonListEntity
          .map((v) => (v as PokemonModel).toJson())
          .toList();
    }
    return data;
  }
}
