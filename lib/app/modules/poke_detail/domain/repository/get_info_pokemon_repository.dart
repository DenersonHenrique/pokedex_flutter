import 'package:flutter_pokedex/app/modules/poke_detail/domain/entity/pokemon_detail_entity.dart';

abstract class IPokemonInfoRepository {
  Future<PokemonDetailEntity> getInfoPokemon(int id);
}
