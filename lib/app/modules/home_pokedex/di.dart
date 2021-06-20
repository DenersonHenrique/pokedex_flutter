import 'package:get_it/get_it.dart';
import 'package:flutter_pokedex/app/modules/home_pokedex/data/datasource/pokedex_home_datasource.dart';
import 'package:flutter_pokedex/app/modules/home_pokedex/domain/usecase/get_list_pokemon_usecase.dart';
import 'package:flutter_pokedex/app/modules/home_pokedex/ui/home_page/controller/pokedex_home_controller.dart';
import 'package:flutter_pokedex/app/modules/home_pokedex/data/repository/get_list_pokemon_repository_imp.dart';

class PokedexHomeInjection {
  void call(GetIt instanceGetIt) {
    instanceGetIt
      ..registerLazySingleton<PokedexHomeDataSource>(
        () => PokedexHomeDataSource(),
      )
      ..registerLazySingleton<PokedexHomeRepository>(
        () => PokedexHomeRepository(
          instanceGetIt<PokedexHomeDataSource>(),
        ),
      )
      ..registerLazySingleton<GetListPokemonUsecase>(
        () => GetListPokemonUsecase(
          instanceGetIt<PokedexHomeRepository>(),
        ),
      )
      ..registerSingleton<PokedexHomeController>(
        PokedexHomeController(
          getListPokemonUsecase: instanceGetIt<GetListPokemonUsecase>(),
        ),
      );
  }
}
