import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_pokedex/pages/poke_detail/widgets/poke_about.dart';
import 'package:flutter_pokedex/pages/poke_detail/widgets/poke_evolution.dart';
import 'package:flutter_pokedex/stores/poke_api-store.dart';
import 'package:flutter_pokedex/stores/poke_apiv2-store.dart';
import 'package:get_it/get_it.dart';
import 'package:md2_tab_indicator/md2_tab_indicator.dart';

class AboutItem extends StatefulWidget {
  @override
  _AboutItemState createState() => _AboutItemState();
}

class _AboutItemState extends State<AboutItem>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  PageController _pageController;
  PokeApiStore _pokemonStore;
  PokeApiV2Store _pokeApiV2Store;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _pokemonStore = GetIt.instance<PokeApiStore>();
    _pokeApiV2Store = GetIt.instance<PokeApiV2Store>();
    _pageController = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(35),
          child: Observer(builder: (context) {
            _pokeApiV2Store.getInfoPokemon(_pokemonStore.currentPokemon.name);
            _pokeApiV2Store
                .getInfoSpecie(_pokemonStore.currentPokemon.id.toString());
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
              labelColor: _pokemonStore.pokeColor, // Color label.
              unselectedLabelColor: Color(0xff5f6368), //niceish grey
              isScrollable: true, //up to your taste
              indicator: MD2Indicator(
                  //it begins here
                  indicatorHeight: 3,
                  indicatorColor: _pokemonStore.pokeColor,
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
          PokeAbout(),
          PokeEvolution(),
          Container(color: Colors.green),
        ],
      ),
    );
  }
}
