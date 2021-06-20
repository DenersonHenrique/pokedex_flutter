import 'package:flutter/material.dart';
import 'package:flutter_pokedex/app/constants/consts_api.dart';
import 'package:flutter_pokedex/app/constants/consts_app.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_pokedex/app/modules/home_pokedex/ui/home_page/widgets/poke_item_type_widget.dart';

class PokeItem extends StatelessWidget {
  final int index;
  final String name;
  final Color color;
  final String number;
  final List<String> types;

  const PokeItem({
    Key key,
    this.name,
    this.index,
    this.color,
    this.number,
    this.types,
  });

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.bottomRight,
                  child: Hero(
                    child: Opacity(
                      child: Image.asset(
                        ConstsApp.whitePokeball,
                        height: 130,
                        width: 130,
                      ),
                      opacity: 0.2,
                    ),
                    tag: name + 'rotation',
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 4.0, top: 10),
                      child: Text(
                        name,
                        style: TextStyle(
                          fontFamily: 'Google',
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: PokeItemTypeWidget(
                        types: types,
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Hero(
                    child: CachedNetworkImage(
                      height: 80,
                      width: 80,
                      placeholder: (context, url) => new Container(
                        color: Colors.transparent,
                      ),
                      imageUrl: '${ConstsApi.pokeImageUrl}$number.png',
                    ),
                    tag: name,
                  ),
                ),
              ],
            ),
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                ConstsApp.getColorType(type: types[0]),
                ConstsApp.getColorType(type: types[0]).withOpacity(0.7),
              ],
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(25.0),
            ),
          ),
        ),
      );
}
