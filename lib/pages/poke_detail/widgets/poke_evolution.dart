import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_pokedex/models/pokeApi.dart';
import 'package:flutter_pokedex/stores/poke_api-store.dart';
import 'package:get_it/get_it.dart';

class PokeEvolution extends StatelessWidget {
  final PokeApiStore _pokeApiStore = GetIt.instance<PokeApiStore>();

  Widget resizePokemon(Widget widget) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: SizedBox(height: 80, width: 80, child: widget),
    );
  }

  Widget pokeName(String name) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: Text(
        name,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  List<Widget> getEvolution(Pokemon pokemon) {
    List<Widget> _list = [];
    if (pokemon.prevEvolution != null) {
      pokemon.prevEvolution.forEach((element) {
        _list.add(resizePokemon(_pokeApiStore.getImage(numero: element.num)));// Add image
        _list.add(pokeName(element.name));// Add name
        _list.add(Icon(Icons.keyboard_arrow_down));// Add icon
      });
    }
    // Add Current Pokemon
    _list.add(resizePokemon(
        _pokeApiStore.getImage(numero: _pokeApiStore.currentPokemon.num)));
        _list.add(pokeName(_pokeApiStore.currentPokemon.name));// Add name

    if (pokemon.nextEvolution != null) {
      _list.add(Icon(Icons.keyboard_arrow_down));
      pokemon.nextEvolution.forEach((element) {
        _list.add(resizePokemon(_pokeApiStore.getImage(numero: element.num)));// Add image
        _list.add(pokeName(element.name));// Add name
        if (pokemon.nextEvolution.last.name != element.name) {
          _list.add(Icon(Icons.keyboard_arrow_down));// Add icon
        }
      });
    }

    return _list;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        child: Observer(builder: (context) {
          Pokemon pokemon = _pokeApiStore.currentPokemon;
          return SingleChildScrollView(
            child: Column(
                // children: <Widget>[],
                crossAxisAlignment: CrossAxisAlignment.center,
                children: getEvolution(pokemon)),
          );
        }),
      ),
    );
  }
}
