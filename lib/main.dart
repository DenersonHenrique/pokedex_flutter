import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pokedex/app/app_widget.dart';
import 'package:flutter_pokedex/app/modules/poke_detail/di.dart';
import 'package:flutter_pokedex/app/modules/home_pokedex/di.dart';

void main() {
  GetIt getIt = GetIt.instance;
  final pokedexHomeInjection = PokedexHomeInjection();
  pokedexHomeInjection.call(getIt);
  final pokemonDetailInjection = PokemonDetailInjection();
  pokemonDetailInjection.call(getIt);
  return runApp(PokedexApp());
}
