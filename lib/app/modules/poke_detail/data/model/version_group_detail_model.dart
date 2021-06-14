import 'package:flutter_pokedex/app/modules/poke_detail/data/model/ability_model.dart';
import 'package:flutter_pokedex/app/modules/poke_detail/domain/entity/version_group_detail_entity.dart';

class VersionGroupDetailsModel extends VersionGroupDetailsEntity {
  VersionGroupDetailsModel({
    int levelLearnedAt,
    AbilitiesModel moveLearnMethod,
    AbilitiesModel versionGroup,
  }) : super(
          levelLearnedAt: levelLearnedAt,
          moveLearnMethod: moveLearnMethod,
          versionGroup: versionGroup,
        );

  VersionGroupDetailsModel.fromJson(Map<String, dynamic> json) {
    levelLearnedAt = json['level_learned_at'];
    moveLearnMethod = json['move_learn_method'] != null
        ? new AbilitiesModel.fromJson(json['move_learn_method'])
        : null;
    versionGroup = json['version_group'] != null
        ? new AbilitiesModel.fromJson(json['version_group'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['level_learned_at'] = this.levelLearnedAt;
    if (this.moveLearnMethod != null) {
      data['move_learn_method'] = this.moveLearnMethod; // Atention point.
    }
    if (this.versionGroup != null) {
      data['version_group'] = this.versionGroup; // Atention point.
    }
    return data;
  }
}
