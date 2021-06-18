import 'package:flutter/material.dart';

class PokemonHeaderWidget extends StatelessWidget {
  final double progress;
  final String pokeName;
  final String pokeNumber;
  final List<String> pokeType;

  const PokemonHeaderWidget({
    @required this.progress,
    @required this.pokeName,
    @required this.pokeType,
    @required this.pokeNumber,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Stack(
        children: <Widget>[
          Positioned(
            top: MediaQuery.of(context).size.height * 0.12 -
                progress * (MediaQuery.of(context).size.height * 0.060),
            left: 20 + progress * (MediaQuery.of(context).size.height * 0.060),
            child: Text(
              pokeName,
              style: TextStyle(
                  fontFamily: 'Google',
                  fontSize: 35 -
                      progress * (MediaQuery.of(context).size.height * 0.011),
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.19,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, top: 8, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    setTipos(pokeType),
                    Text(
                      '#' + pokeNumber,
                      style: TextStyle(
                          fontFamily: 'Google',
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      );

  Widget setTipos(List<String> types) {
    List<Widget> list = [];
    types.forEach(
      (name) {
        list.add(
          Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color.fromARGB(80, 255, 255, 255)),
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Text(
                    name.trim(),
                    style: TextStyle(
                        fontFamily: 'Google',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                width: 8,
              ),
            ],
          ),
        );
      },
    );
    return Row(
      children: list,
      crossAxisAlignment: CrossAxisAlignment.start,
    );
  }
}
