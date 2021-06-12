import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_pokedex/models/pokeApiV2.dart';
import 'package:flutter_pokedex/stores/poke_apiv2-store.dart';
import 'package:get_it/get_it.dart';

class PokeStatus extends StatelessWidget {
  final PokeApiV2Store _pokeApiV2Store = GetIt.instance<PokeApiV2Store>();

  final List<String> _statusName = [
    'Speed',
    'Sp. Def',
    'Sp. Att',
    'Defense',
    'Attack',
    'HP',
    'Total'
  ];
  // Return label
  List<Widget> pokeStatusName() {
    List<Widget> status = [];
    _statusName.forEach((element) {
      status.add(
        Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Text(
            element,
            style: TextStyle(fontSize: 18, color: Colors.grey[800]),
          ),
        ),
      );
    });
    return status;
  }

  //Return value status
  List<Widget> pokeStatusValue(List pokeValue) {
    List<Widget> value = [];
    pokeValue.forEach((element) {
      value.add(
        Padding(
          padding: const EdgeInsets.only(left: 10.0, bottom: 10.0),
          child: Text(
            element.toString(),
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      );
    });
    return value;
  }

  //Return StatusBar
  List<Widget> pokeStatusBar(List pokeStatusBar) {
    List<Widget> status = [];
    int lastItem = pokeStatusBar.last;
    pokeStatusBar.forEach((element) {
      if (element == lastItem) {
        status.add(Padding(
          padding: const EdgeInsets.only(left: 10.0, bottom: 12.0),
          child: StatusBar(
            widthFactor: element / 600,
          ),
        ));
      } else {
        status.add(Padding(
          padding: const EdgeInsets.only(left: 10.0, bottom: 12.0),
          child: StatusBar(
            widthFactor: element / 160,
          ),
        ));
      }
    });
    return status;
  }

  List<int> getStatusPokemon(PokeApiV2 pokeApiV2) {
    List<int> list = [1, 2, 3, 4, 5, 6, 7];
    int sum = 0;
    pokeApiV2.stats.forEach((element) {
      sum = sum + element.baseStat;
      switch (element.stat.name) {
        case 'speed':
          list[0] = element.baseStat;
          break;
        case 'special-defense':
          list[1] = element.baseStat;
          break;
        case 'special-attack':
          list[2] = element.baseStat;
          break;
        case 'defense':
          list[3] = element.baseStat;
          break;
        case 'attack':
          list[4] = element.baseStat;
          break;
        case 'hp':
          list[5] = element.baseStat;
          break;
      }
    });
    list[6] = sum;

    return list;
  }

  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 30.0),
        child: Observer(builder: (context) {
          return Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: pokeStatusName(),
              ),
              Observer(builder: (context) {
                List<int> _list = getStatusPokemon(_pokeApiV2Store.pokeApiV2);
                return Column(
                  children: pokeStatusValue(_list),
                );
              }),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Observer(builder: (context) {
                    List<int> _list =
                        getStatusPokemon(_pokeApiV2Store.pokeApiV2);
                    return Column(
                      children: pokeStatusBar(_list),
                    );
                  }),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}

class StatusBar extends StatelessWidget {
  final double widthFactor;

  const StatusBar({Key key, this.widthFactor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 19,
      child: Center(
        child: Container(
          height: 8,
          width: MediaQuery.of(context).size.width * .47,
          alignment: Alignment.centerLeft,
          decoration: ShapeDecoration(
            shape: StadiumBorder(),
            color: Colors.grey,
          ),
          child: FractionallySizedBox(
            widthFactor: widthFactor,
            heightFactor: 1.0,
            child: Container(
              decoration: ShapeDecoration(
                shape: StadiumBorder(),
                color: widthFactor > 0.5 ? Colors.teal : Colors.red,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
