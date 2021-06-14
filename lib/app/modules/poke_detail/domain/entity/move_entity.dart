import 'package:flutter_pokedex/app/modules/poke_detail/domain/entity/ability_entity.dart';
import 'package:flutter_pokedex/app/modules/poke_detail/domain/entity/version_group_detail_entity.dart';

class MoveEntity {
  AbilitiesEntity move;
  List<VersionGroupDetailsEntity> versionGroupDetails;

  MoveEntity({
    this.move,
    this.versionGroupDetails,
  });
}
