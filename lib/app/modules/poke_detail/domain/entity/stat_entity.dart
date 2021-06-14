import 'package:flutter_pokedex/app/modules/poke_detail/domain/entity/ability_entity.dart';

class StatEntity {
  int baseStat;
  int effort;
  AbilitiesEntity stat;

  StatEntity({
    this.baseStat,
    this.effort,
    this.stat,
  });
}
