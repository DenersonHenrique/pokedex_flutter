import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_pokedex/app/modules/home_pokedex/domain/entity/pokemon_entity.dart';
import 'package:flutter_pokedex/app/modules/home_pokedex/ui/home_page/controller/pokedex_home_controller.dart';

class PokeEvolutionWidget extends StatelessWidget {
  final PokedexHomeController _pokedexHomeController =
      GetIt.instance<PokedexHomeController>();

  Widget resizePokemon(Widget widget) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: SizedBox(height: 70, width: 70, child: widget),
    );
  }

  Widget pokeName(String name) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: Text(
        name,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  List<Widget> getEvolution(PokemonEntity pokemon) {
    List<Widget> _list = [];
    if (pokemon.prevEvolution != null) {
      pokemon.prevEvolution.forEach((element) {
        _list.add(resizePokemon(_pokedexHomeController.getImage(
            numero: element.number))); // Add image
        _list.add(pokeName(element.name)); // Add name
        _list.add(Icon(Icons.keyboard_arrow_down)); // Add icon
      });
    }

    _list.add(resizePokemon(_pokedexHomeController.getImage(
        numero: _pokedexHomeController.currentPokemon.number)));
    _list.add(pokeName(_pokedexHomeController.currentPokemon.name)); // Add name

    if (pokemon.nextEvolution != null) {
      _list.add(Icon(Icons.keyboard_arrow_down));
      pokemon.nextEvolution.forEach(
        (element) {
          _list.add(resizePokemon(_pokedexHomeController.getImage(
              numero: element.number))); // Add image
          _list.add(pokeName(element.name)); // Add name
          if (pokemon.nextEvolution.last.name != element.name) {
            _list.add(Icon(Icons.keyboard_arrow_down)); // Add icon
          }
        },
      );
    }
    return _list;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        child: Observer(
          builder: (context) {
            PokemonEntity pokemon = _pokedexHomeController.currentPokemon;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: getEvolution(pokemon),
            );
          },
        ),
      ),
    );
  }
}
