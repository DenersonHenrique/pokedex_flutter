import 'package:flutter_pokedex/app/modules/poke_detail/domain/entity/ability_entity.dart';

class VersionGroupDetailsEntity {
  int levelLearnedAt;
  AbilitiesEntity moveLearnMethod;
  AbilitiesEntity versionGroup;

  VersionGroupDetailsEntity({
    this.levelLearnedAt,
    this.moveLearnMethod,
    this.versionGroup,
  });
}
