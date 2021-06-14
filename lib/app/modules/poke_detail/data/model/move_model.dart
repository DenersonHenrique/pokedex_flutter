import 'package:flutter_pokedex/app/modules/poke_detail/data/model/ability_model.dart';
import 'package:flutter_pokedex/app/modules/poke_detail/domain/entity/move_entity.dart';
import 'package:flutter_pokedex/app/modules/poke_detail/data/model/version_group_detail_model.dart';

class MoveModel extends MoveEntity {
  MoveModel({
    AbilitiesModel move,
    List<VersionGroupDetailsModel> versionGroupDetails,
  }) : super(
          move: move,
          versionGroupDetails: versionGroupDetails,
        );

  MoveModel.fromJson(Map<String, dynamic> json) {
    move =
        json['move'] != null ? new AbilitiesModel.fromJson(json['move']) : null;
    if (json['version_group_details'] != null) {
      versionGroupDetails = <VersionGroupDetailsModel>[];
      json['version_group_details'].forEach((v) {
        versionGroupDetails.add(new VersionGroupDetailsModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.move != null) {
      data['move'] = this.move; // Atention point.
    }
    if (this.versionGroupDetails != null) {
      data['version_group_details'] = this
          .versionGroupDetails
          .map((v) => (v as VersionGroupDetailsModel).toJson())
          .toList();
    }
    return data;
  }
}
