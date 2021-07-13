import 'package:get_it/get_it.dart';
import 'package:flutter_pokedex/app/core/httpClient/http_client_imp.dart';
import 'package:flutter_pokedex/app/modules/poke_detail/data/datasource/pokemon_info_datasource.dart';
import 'package:flutter_pokedex/app/modules/poke_detail/domain/usecase/get_info_pokemon_by_id_usecase.dart';
import 'package:flutter_pokedex/app/modules/poke_detail/data/repository/get_info_pokemon_repository_imp.dart';
import 'package:flutter_pokedex/app/modules/poke_detail/ui/detail_page/controller/pokemon_detail_controller.dart';

class PokemonDetailInjection {
  void call(GetIt instanceGetIt) {
    instanceGetIt
      ..registerLazySingleton<PokemonInfoDataSource>(
        () => PokemonInfoDataSource(
          instanceGetIt<HttpClient>(),
        ),
      )
      ..registerLazySingleton<PokemonInfoRepository>(
        () => PokemonInfoRepository(
          instanceGetIt<PokemonInfoDataSource>(),
        ),
      )
      ..registerLazySingleton<GetInfoPokemonByIdUsecase>(
        () => GetInfoPokemonByIdUsecase(
          instanceGetIt<PokemonInfoRepository>(),
        ),
      )
      ..registerSingleton<PokemonDetailController>(
        PokemonDetailController(
          getInfoPokemonByIdUsecase: instanceGetIt<GetInfoPokemonByIdUsecase>(),
        ),
      );
  }
}
