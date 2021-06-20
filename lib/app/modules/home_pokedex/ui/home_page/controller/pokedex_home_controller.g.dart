// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokedex_home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PokedexHomeController on _PokedexHomeControllerBase, Store {
  Computed<PokemonListEntity> _$pokemonListComputed;

  @override
  PokemonListEntity get pokemonList => (_$pokemonListComputed ??=
          Computed<PokemonListEntity>(() => super.pokemonList,
              name: '_PokedexHomeControllerBase.pokemonList'))
      .value;
  Computed<PokemonEntity> _$currentPokemonComputed;

  @override
  PokemonEntity get currentPokemon => (_$currentPokemonComputed ??=
          Computed<PokemonEntity>(() => super.currentPokemon,
              name: '_PokedexHomeControllerBase.currentPokemon'))
      .value;
  Computed<Color> _$pokeColorComputed;

  @override
  Color get pokeColor =>
      (_$pokeColorComputed ??= Computed<Color>(() => super.pokeColor,
              name: '_PokedexHomeControllerBase.pokeColor'))
          .value;

  final _$_pokemonListAtom =
      Atom(name: '_PokedexHomeControllerBase._pokemonList');

  @override
  PokemonListEntity get _pokemonList {
    _$_pokemonListAtom.reportRead();
    return super._pokemonList;
  }

  @override
  set _pokemonList(PokemonListEntity value) {
    _$_pokemonListAtom.reportWrite(value, super._pokemonList, () {
      super._pokemonList = value;
    });
  }

  final _$_currentPokemonAtom =
      Atom(name: '_PokedexHomeControllerBase._currentPokemon');

  @override
  PokemonEntity get _currentPokemon {
    _$_currentPokemonAtom.reportRead();
    return super._currentPokemon;
  }

  @override
  set _currentPokemon(PokemonEntity value) {
    _$_currentPokemonAtom.reportWrite(value, super._currentPokemon, () {
      super._currentPokemon = value;
    });
  }

  final _$_pokeColorAtom = Atom(name: '_PokedexHomeControllerBase._pokeColor');

  @override
  Color get _pokeColor {
    _$_pokeColorAtom.reportRead();
    return super._pokeColor;
  }

  @override
  set _pokeColor(Color value) {
    _$_pokeColorAtom.reportWrite(value, super._pokeColor, () {
      super._pokeColor = value;
    });
  }

  final _$currentPositionAtom =
      Atom(name: '_PokedexHomeControllerBase.currentPosition');

  @override
  int get currentPosition {
    _$currentPositionAtom.reportRead();
    return super.currentPosition;
  }

  @override
  set currentPosition(int value) {
    _$currentPositionAtom.reportWrite(value, super.currentPosition, () {
      super.currentPosition = value;
    });
  }

  final _$fetchPokemonListAsyncAction =
      AsyncAction('_PokedexHomeControllerBase.fetchPokemonList');

  @override
  Future fetchPokemonList() {
    return _$fetchPokemonListAsyncAction.run(() => super.fetchPokemonList());
  }

  final _$_PokedexHomeControllerBaseActionController =
      ActionController(name: '_PokedexHomeControllerBase');

  @override
  dynamic setCurrentPokemon({int index}) {
    final _$actionInfo = _$_PokedexHomeControllerBaseActionController
        .startAction(name: '_PokedexHomeControllerBase.setCurrentPokemon');
    try {
      return super.setCurrentPokemon(index: index);
    } finally {
      _$_PokedexHomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentPosition: ${currentPosition},
pokemonList: ${pokemonList},
currentPokemon: ${currentPokemon},
pokeColor: ${pokeColor}
    ''';
  }
}
