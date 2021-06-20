import 'package:flutter_pokedex/app/modules/home_pokedex/domain/entity/pokemon_entity.dart';
import 'package:flutter_pokedex/app/modules/home_pokedex/data/model/pokemon_prev_evolution_model.dart';
import 'package:flutter_pokedex/app/modules/home_pokedex/data/model/pokemon_next_evolution_model.dart';

class PokemonModel extends PokemonEntity {
  PokemonModel({
    int id,
    String number,
    String name,
    String img,
    List<String> type,
    String height,
    String weight,
    String candy,
    String egg,
    List<NextEvolutionModel> nextEvolution,
    List<PrevEvolutionModel> prevEvolution,
  }) : super(
          id: id,
          number: number,
          name: name,
          img: img,
          type: type,
          height: height,
          weight: weight,
          candy: candy,
          egg: egg,
          nextEvolution: nextEvolution,
          prevEvolution: prevEvolution,
        );

  PokemonModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    number = json['num'];
    name = json['name'];
    img = json['img'];
    type = json['type'].cast<String>();
    height = json['height'];
    weight = json['weight'];
    candy = json['candy'];
    egg = json['egg'];
    if (json['next_evolution'] != null) {
      nextEvolution = <NextEvolutionModel>[];
      json['next_evolution'].forEach((v) {
        nextEvolution.add(new NextEvolutionModel.fromJson(v));
      });
    }
    if (json['prev_evolution'] != null) {
      prevEvolution = <PrevEvolutionModel>[];
      json['prev_evolution'].forEach((v) {
        prevEvolution.add(new PrevEvolutionModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['num'] = this.number;
    data['name'] = this.name;
    data['img'] = this.img;
    data['type'] = this.type;
    data['height'] = this.height;
    data['weight'] = this.weight;
    data['candy'] = this.candy;
    data['egg'] = this.egg;
    if (this.nextEvolution != null) {
      data['next_evolution'] = this
          .nextEvolution
          .map((v) => (v as NextEvolutionModel).toJson())
          .toList();
    }
    if (this.prevEvolution != null) {
      data['prev_evolution'] = this
          .prevEvolution
          .map((v) => (v as PrevEvolutionModel).toJson())
          .toList();
    }
    return data;
  }
}
