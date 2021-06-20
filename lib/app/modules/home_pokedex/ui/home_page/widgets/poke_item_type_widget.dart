import 'package:flutter/material.dart';

class PokeItemTypeWidget extends StatelessWidget {
  final List<String> types;

  const PokeItemTypeWidget({
    @required this.types,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> typeList = [];
    types.forEach(
      (name) {
        typeList.add(
          Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromARGB(80, 255, 255, 255),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Text(
                    name.trim(),
                    style: TextStyle(
                      fontFamily: 'Google',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              )
            ],
          ),
        );
      },
    );
    return Column(
      children: typeList,
      crossAxisAlignment: CrossAxisAlignment.start,
    );
  }
}
