import 'package:flutter/material.dart';
import 'package:flutter_pokedex/app/constants/app_string.dart';

class AppBarHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        child: Column(
          children: <Widget>[
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 6,
                      right: 5,
                    ),
                    child: IconButton(
                      icon: Icon(Icons.menu),
                      iconSize: 30.0,
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 22.0),
                  child: Text(
                    AppString.appTitleAppBar,
                    style: TextStyle(
                      fontFamily: 'Google',
                      fontWeight: FontWeight.bold,
                      fontSize: 38.0,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        height: 120,
      );
}
