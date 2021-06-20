import 'package:flutter_pokedex/app/modules/home_pokedex/domain/entity/pokemon_prev_evolution_entity.dart';

class PrevEvolutionModel extends PrevEvolutionEntity {
  PrevEvolutionModel({
    String number,
    String name,
  }) : super(
          name: name,
          number: number,
        );

  PrevEvolutionModel.fromJson(Map<String, dynamic> json) {
    number = json['num'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['num'] = this.number;
    data['name'] = this.name;
    return data;
  }
}
