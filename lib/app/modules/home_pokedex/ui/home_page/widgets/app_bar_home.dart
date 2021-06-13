import 'package:flutter/material.dart';

class AppBarHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          // Menu icon position.
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 6, right: 5),
                  child: IconButton(
                    icon: Icon(Icons.menu),
                    iconSize: 30.0,
                    onPressed: () {},
                  ),
                )
              ],
            ),
          ),
          // Title posiion.
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 22.0),
                child: Text(
                  'Pokedex',
                  style: TextStyle(
                      fontFamily: 'Google',
                      fontWeight: FontWeight.bold,
                      fontSize: 38.0),
                ),
              ),
            ],
          ),
        ],
      ),
      height: 120,
    );
  }
}
