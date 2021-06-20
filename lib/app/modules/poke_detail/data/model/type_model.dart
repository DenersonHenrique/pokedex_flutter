import 'package:flutter_pokedex/app/modules/poke_detail/data/model/ability_model.dart';
import 'package:flutter_pokedex/app/modules/poke_detail/domain/entity/type_entity.dart';

class TypeModel extends TypeEntity {
  TypeModel({
    int slot,
    AbilitiesModel type,
  }) : super(
          slot: slot,
          type: type,
        );

  TypeModel.fromJson(Map<String, dynamic> json) {
    slot = json['slot'];
    type =
        json['type'] != null ? new AbilitiesModel.fromJson(json['type']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['slot'] = this.slot;
    if (this.type != null) {
      data['type'] = this.type;
    }
    return data;
  }
}
