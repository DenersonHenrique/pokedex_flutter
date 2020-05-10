// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poke_api-store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PokeApiStore on _PokeApiStoreBase, Store {
  Computed<PokeApi> _$pokeAPIComputed;

  @override
  PokeApi get pokeAPI =>
      (_$pokeAPIComputed ??= Computed<PokeApi>(() => super.pokeAPI)).value;
  Computed<Pokemon> _$currentPokemonComputed;

  @override
  Pokemon get currentPokemon => (_$currentPokemonComputed ??=
          Computed<Pokemon>(() => super.currentPokemon))
      .value;

  final _$_pokeAPIAtom = Atom(name: '_PokeApiStoreBase._pokeAPI');

  @override
  PokeApi get _pokeAPI {
    _$_pokeAPIAtom.context.enforceReadPolicy(_$_pokeAPIAtom);
    _$_pokeAPIAtom.reportObserved();
    return super._pokeAPI;
  }

  @override
  set _pokeAPI(PokeApi value) {
    _$_pokeAPIAtom.context.conditionallyRunInAction(() {
      super._pokeAPI = value;
      _$_pokeAPIAtom.reportChanged();
    }, _$_pokeAPIAtom, name: '${_$_pokeAPIAtom.name}_set');
  }

  final _$_currentPokemonAtom = Atom(name: '_PokeApiStoreBase._currentPokemon');

  @override
  Pokemon get _currentPokemon {
    _$_currentPokemonAtom.context.enforceReadPolicy(_$_currentPokemonAtom);
    _$_currentPokemonAtom.reportObserved();
    return super._currentPokemon;
  }

  @override
  set _currentPokemon(Pokemon value) {
    _$_currentPokemonAtom.context.conditionallyRunInAction(() {
      super._currentPokemon = value;
      _$_currentPokemonAtom.reportChanged();
    }, _$_currentPokemonAtom, name: '${_$_currentPokemonAtom.name}_set');
  }

  final _$pokeColorAtom = Atom(name: '_PokeApiStoreBase.pokeColor');

  @override
  Color get pokeColor {
    _$pokeColorAtom.context.enforceReadPolicy(_$pokeColorAtom);
    _$pokeColorAtom.reportObserved();
    return super.pokeColor;
  }

  @override
  set pokeColor(Color value) {
    _$pokeColorAtom.context.conditionallyRunInAction(() {
      super.pokeColor = value;
      _$pokeColorAtom.reportChanged();
    }, _$pokeColorAtom, name: '${_$pokeColorAtom.name}_set');
  }

  final _$currentPositionAtom = Atom(name: '_PokeApiStoreBase.currentPosition');

  @override
  int get currentPosition {
    _$currentPositionAtom.context.enforceReadPolicy(_$currentPositionAtom);
    _$currentPositionAtom.reportObserved();
    return super.currentPosition;
  }

  @override
  set currentPosition(int value) {
    _$currentPositionAtom.context.conditionallyRunInAction(() {
      super.currentPosition = value;
      _$currentPositionAtom.reportChanged();
    }, _$currentPositionAtom, name: '${_$currentPositionAtom.name}_set');
  }

  final _$_PokeApiStoreBaseActionController =
      ActionController(name: '_PokeApiStoreBase');

  @override
  dynamic fetchPokemonList() {
    final _$actionInfo = _$_PokeApiStoreBaseActionController.startAction();
    try {
      return super.fetchPokemonList();
    } finally {
      _$_PokeApiStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setCurrentPokemon({int index}) {
    final _$actionInfo = _$_PokeApiStoreBaseActionController.startAction();
    try {
      return super.setCurrentPokemon(index: index);
    } finally {
      _$_PokeApiStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Widget getImage({String numero}) {
    final _$actionInfo = _$_PokeApiStoreBaseActionController.startAction();
    try {
      return super.getImage(numero: numero);
    } finally {
      _$_PokeApiStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'pokeColor: ${pokeColor.toString()},currentPosition: ${currentPosition.toString()},pokeAPI: ${pokeAPI.toString()},currentPokemon: ${currentPokemon.toString()}';
    return '{$string}';
  }
}
