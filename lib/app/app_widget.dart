import 'package:flutter/material.dart';
import 'package:flutter_pokedex/app/constants/app_string.dart';
import 'package:flutter_pokedex/app/modules/home_pokedex/ui/home_page/home_page.dart';

class PokedexApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppString.appTitleAppBar,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
