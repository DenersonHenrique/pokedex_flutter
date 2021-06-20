import 'package:flutter_pokedex/app/modules/poke_detail/data/model/ability_model.dart';
import 'package:flutter_pokedex/app/modules/poke_detail/domain/entity/game_indice_entity.dart';

class GameIndicesModel extends GameIndicesEntity {
  GameIndicesModel({
    int gameIndex,
    AbilitiesModel version,
  }) : super(
          gameIndex: gameIndex,
          version: version,
        );

  GameIndicesModel.fromJson(Map<String, dynamic> json) {
    gameIndex = json['game_index'];
    version = json['version'] != null
        ? new AbilitiesModel.fromJson(json['version'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['game_index'] = this.gameIndex;
    if (this.version != null) {
      data['version'] = this.version;
    }
    return data;
  }
}
