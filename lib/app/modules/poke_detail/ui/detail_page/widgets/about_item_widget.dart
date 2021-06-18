import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:md2_tab_indicator/md2_tab_indicator.dart';
import 'package:flutter_pokedex/app/modules/poke_detail/ui/detail_page/widgets/poke_about_widget.dart';
import 'package:flutter_pokedex/app/modules/poke_detail/ui/detail_page/widgets/poke_status_widget.dart';
import 'package:flutter_pokedex/app/modules/poke_detail/ui/detail_page/widgets/poke_evolution_widget.dart';
import 'package:flutter_pokedex/app/modules/home_pokedex/ui/home_page/controller/pokedex_home_controller.dart';
import 'package:flutter_pokedex/app/modules/poke_detail/ui/detail_page/controller/pokemon_detail_controller.dart';
import 'package:get_it/get_it.dart';

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
          child: Observer(builder: (context) {
            _pokemonDetailController
                .getInfoPokemon(_pokedexHomeController.currentPokemon.id);
            _pokemonDetailController.getInfoSpecie(
                _pokedexHomeController.currentPokemon.id.toString());
            return TabBar(
              onTap: (index) {
                _pageController.animateToPage(index,
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut);
              },
              controller: _tabController,
              labelStyle: TextStyle(
                  //up to your taste
                  fontWeight: FontWeight.w700),
              indicatorSize: TabBarIndicatorSize.label, //makes it better
              labelColor: _pokedexHomeController.pokeColor, // Color label.
              unselectedLabelColor: Color(0xff5f6368), //niceish grey
              isScrollable: true, //up to your taste
              indicator: MD2Indicator(
                  //it begins here
                  indicatorHeight: 3,
                  indicatorColor: _pokedexHomeController.pokeColor,
                  indicatorSize: MD2IndicatorSize
                      .normal //3 different modes tiny-normal-full
                  ),
              tabs: <Widget>[
                Tab(
                  text: "About",
                ),
                Tab(
                  text: "Evolution",
                ),
                Tab(
                  text: "Status",
                ),
              ],
            );
          }),
        ),
      ),
      body: PageView(
        onPageChanged: (index) {
          _tabController.animateTo(index,
              duration: Duration(milliseconds: 300));
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
