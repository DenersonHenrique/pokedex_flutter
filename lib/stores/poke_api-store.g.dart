// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poke_api-store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PokeApiStore on _PokeApiStoreBase, Store {
  Computed<PokeApi> _$pokeAPIComputed;

  @override
  PokeApi get pokeAPI =>
      (_$pokeAPIComputed ??= Computed<PokeApi>(() => super.pokeAPI,
              name: '_PokeApiStoreBase.pokeAPI'))
          .value;
  Computed<Pokemon> _$currentPokemonComputed;

  @override
  Pokemon get currentPokemon => (_$currentPokemonComputed ??= Computed<Pokemon>(
          () => super.currentPokemon,
          name: '_PokeApiStoreBase.currentPokemon'))
      .value;

  final _$_pokeAPIAtom = Atom(name: '_PokeApiStoreBase._pokeAPI');

  @override
  PokeApi get _pokeAPI {
    _$_pokeAPIAtom.reportRead();
    return super._pokeAPI;
  }

  @override
  set _pokeAPI(PokeApi value) {
    _$_pokeAPIAtom.reportWrite(value, super._pokeAPI, () {
      super._pokeAPI = value;
    });
  }

  final _$_currentPokemonAtom = Atom(name: '_PokeApiStoreBase._currentPokemon');

  @override
  Pokemon get _currentPokemon {
    _$_currentPokemonAtom.reportRead();
    return super._currentPokemon;
  }

  @override
  set _currentPokemon(Pokemon value) {
    _$_currentPokemonAtom.reportWrite(value, super._currentPokemon, () {
      super._currentPokemon = value;
    });
  }

  final _$pokeColorAtom = Atom(name: '_PokeApiStoreBase.pokeColor');

  @override
  Color get pokeColor {
    _$pokeColorAtom.reportRead();
    return super.pokeColor;
  }

  @override
  set pokeColor(Color value) {
    _$pokeColorAtom.reportWrite(value, super.pokeColor, () {
      super.pokeColor = value;
    });
  }

  final _$currentPositionAtom = Atom(name: '_PokeApiStoreBase.currentPosition');

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

  final _$_PokeApiStoreBaseActionController =
      ActionController(name: '_PokeApiStoreBase');

  @override
  dynamic fetchPokemonList() {
    final _$actionInfo = _$_PokeApiStoreBaseActionController.startAction(
        name: '_PokeApiStoreBase.fetchPokemonList');
    try {
      return super.fetchPokemonList();
    } finally {
      _$_PokeApiStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setCurrentPokemon({int index}) {
    final _$actionInfo = _$_PokeApiStoreBaseActionController.startAction(
        name: '_PokeApiStoreBase.setCurrentPokemon');
    try {
      return super.setCurrentPokemon(index: index);
    } finally {
      _$_PokeApiStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Widget getImage({String numero}) {
    final _$actionInfo = _$_PokeApiStoreBaseActionController.startAction(
        name: '_PokeApiStoreBase.getImage');
    try {
      return super.getImage(numero: numero);
    } finally {
      _$_PokeApiStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pokeColor: ${pokeColor},
currentPosition: ${currentPosition},
pokeAPI: ${pokeAPI},
currentPokemon: ${currentPokemon}
    ''';
  }
}
