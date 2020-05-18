import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_pokedex/components/circular_progress_about.dart';
import 'package:flutter_pokedex/models/specie.dart';
import 'package:flutter_pokedex/stores/poke_api-store.dart';
import 'package:flutter_pokedex/stores/poke_apiv2-store.dart';
import 'package:get_it/get_it.dart';

class PokeAbout extends StatelessWidget {
  final PokeApiV2Store _pokeApiV2Store = GetIt.instance<PokeApiV2Store>();
  final PokeApiStore _pokeApiStore = GetIt.instance<PokeApiStore>();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        child: Column(
          children: <Widget>[
            Text(
              'Description',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Observer(builder: (context) {
              Specie _specie = _pokeApiV2Store.specie;
              return SizedBox(
                height: 100,
                child: SingleChildScrollView(
                  child: _specie != null
                      ? Text(
                          _specie.flavorTextEntries
                              .where((description) =>
                                  description.language.name == 'en')
                              .first
                              .flavorText,
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        )
                      : CircularProgressAbout(),
                ),
              );
            }),
            SizedBox(
              height: 10,
            ),
            Text(
              'Biology',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 200),
              child: Observer(
                builder: (context) {
                  return Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Height',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black54,
                            ),
                          ),
                          Text(
                            _pokeApiStore.currentPokemon.height,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Weight',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black54,
                            ),
                          ),
                          Text(
                            _pokeApiStore.currentPokemon.weight,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      )
                    ],
                  );
                },
              ),
            )
          ],
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
      ),
    );
  }
}
