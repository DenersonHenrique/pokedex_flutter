import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_pokedex/app/constants/app_string.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';
import 'package:flutter_pokedex/app/modules/poke_detail/ui/detail_page/widgets/poke_about_widget.dart';
import 'package:flutter_pokedex/app/modules/poke_detail/ui/detail_page/widgets/poke_status_widget.dart';
import 'package:flutter_pokedex/app/modules/poke_detail/ui/detail_page/widgets/poke_evolution_widget.dart';
import 'package:flutter_pokedex/app/modules/home_pokedex/ui/home_page/controller/pokedex_home_controller.dart';
import 'package:flutter_pokedex/app/modules/poke_detail/ui/detail_page/controller/pokemon_detail_controller.dart';

class AboutItemWidget extends StatefulWidget {
  @override
  _AboutItemWidgetState createState() => _AboutItemWidgetState();
}

class _AboutItemWidgetState extends State<AboutItemWidget>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  PageController _pageController;
  PokedexHomeController _pokedexHomeController;
  PokemonDetailController _pokemonDetailController;
  // ReactionDisposer _disposer;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _pokedexHomeController = GetIt.instance<PokedexHomeController>();
    _pokemonDetailController = GetIt.instance<PokemonDetailController>();
    _pageController = PageController(initialPage: 0);
    // _disposer = reaction(
    //   (f) => _pokedexHomeController.currentPokemon,
    //   (r) => _pageController.animateToPage(0,
    //       duration: Duration(milliseconds: 300), curve: Curves.easeInOut),
    // );
  }

  // @override
  // void dispose() {
  //   _disposer();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: Observer(
            builder: (context) {
              _pokemonDetailController.getInfoPokemon(
                _pokedexHomeController.currentPokemon.id,
              );
              _pokemonDetailController.getInfoSpecie(
                _pokedexHomeController.currentPokemon.id.toString(),
              );
              return TabBar(
                onTap: (index) {
                  _pageController.animateToPage(
                    index,
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
                controller: _tabController,
                labelStyle: TextStyle(
                  fontWeight: FontWeight.w700,
                ),
                indicatorSize: TabBarIndicatorSize.label,
                labelColor: _pokedexHomeController.pokeColor,
                unselectedLabelColor: Color(0xff5f6368),
                isScrollable: true,
                indicator: MaterialIndicator(
                  color: _pokedexHomeController.pokeColor,
                  paintingStyle: PaintingStyle.fill,
                ),
                tabs: <Widget>[
                  Tab(
                    text: AppString.aboutItemAboutLabel,
                  ),
                  Tab(
                    text: AppString.aboutItemEvolutionLabel,
                  ),
                  Tab(
                    text: AppString.aboutItemStatusLabel,
                  ),
                ],
              );
            },
          ),
        ),
      ),
      body: PageView(
        onPageChanged: (index) {
          _tabController.animateTo(
            index,
            duration: Duration(milliseconds: 300),
          );
        },
        controller: _pageController,
        children: <Widget>[
          PokeAboutWidget(),
          PokeEvolutionWidget(),
          PokeStatusWidget(),
        ],
      ),
    );
  }
}
