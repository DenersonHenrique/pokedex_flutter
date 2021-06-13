import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pokedex/app/app_widget.dart';
import 'package:flutter_pokedex/stores/poke_api-store.dart';
import 'package:flutter_pokedex/stores/poke_apiv2-store.dart';

void main() {
  GetIt getIt = GetIt.instance;
  getIt.registerSingleton<PokeApiStore>(PokeApiStore());
  getIt.registerSingleton<PokeApiV2Store>(PokeApiV2Store());
  return runApp(PokedexApp());
}
