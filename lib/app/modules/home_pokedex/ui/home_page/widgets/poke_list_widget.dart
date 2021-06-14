import 'package:flutter/material.dart';
import 'package:flutter_pokedex/pages/poke_detail/poke_detail_page.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_pokedex/app/modules/home_pokedex/domain/entity/pokemon_entity.dart';
import 'package:flutter_pokedex/app/modules/home_pokedex/domain/entity/pokemon_list_entity.dart';
import 'package:flutter_pokedex/app/modules/home_pokedex/ui/home_page/widgets/poke_item_widget.dart';

class PokeListWidget extends StatelessWidget {
  final Function getPokemon;
  final Function setCurrentPokemon;
  final PokemonListEntity pokemonList;

  const PokeListWidget({
    @required this.pokemonList,
    @required this.getPokemon,
    @required this.setCurrentPokemon,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => AnimationLimiter(
        child: GridView.builder(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.all(12),
          addAutomaticKeepAlives: true, // Not recreate items.
          gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: pokemonList.pokemonListEntity.length,
          itemBuilder: (context, index) {
            PokemonEntity pokemon = getPokemon(index: index);
            return AnimationConfiguration.staggeredGrid(
              position: index,
              duration: const Duration(milliseconds: 375),
              columnCount: 2,
              child: ScaleAnimation(
                child: GestureDetector(
                  child: PokeItem(
                    types: pokemon.type,
                    index: index,
                    name: pokemon.name,
                    num: pokemon.number,
                  ),
                  onTap: () {
                    setCurrentPokemon(index: index);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => PokeDetailPage(
                          index: index,
                        ),
                        fullscreenDialog: true,
                      ),
                    );
                  },
                ),
              ),
            );
          },
        ),
      );
}
