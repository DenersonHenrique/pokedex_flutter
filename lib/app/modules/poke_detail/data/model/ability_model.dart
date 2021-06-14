import 'package:flutter_pokedex/app/modules/poke_detail/domain/entity/ability_entity.dart';

class AbilitiesModel extends AbilitiesEntity {
  AbilitiesModel({
    int slot,
    bool isHidden,
    AbilityModel ability,
  }) : super(
          ability: ability,
          isHidden: isHidden,
          slot: slot,
        );

  AbilitiesModel.fromJson(Map<String, dynamic> json) {
    ability = json['ability'] != null
        ? new AbilityModel.fromJson(json['ability'])
        : null;
    isHidden = json['is_hidden'];
    slot = json['slot'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.ability != null) {
      data['ability'] = this.ability; // Atention point.
    }
    data['is_hidden'] = this.isHidden;
    data['slot'] = this.slot;
    return data;
  }
}

class AbilityModel extends AbilityEntity {
  AbilityModel({
    String name,
    String url,
  }) : super(
          name: name,
          url: url,
        );

  AbilityModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['url'] = this.url;
    return data;
  }
}
