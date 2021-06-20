import 'package:flutter_pokedex/app/modules/poke_detail/data/model/ability_model.dart';
import 'package:flutter_pokedex/app/modules/poke_detail/domain/entity/stat_entity.dart';

class StatModel extends StatEntity {
  StatModel({
    int baseStat,
    int effort,
    AbilityModel stat,
  }) : super(
          baseStat: baseStat,
          effort: effort,
          stat: stat,
        );

  StatModel.fromJson(Map<String, dynamic> json) {
    baseStat = json['base_stat'];
    effort = json['effort'];
    stat =
        json['stat'] != null ? new AbilityModel.fromJson(json['stat']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['base_stat'] = this.baseStat;
    data['effort'] = this.effort;
    if (this.stat != null) {
      data['stat'] = this.stat;
    }
    return data;
  }
}
