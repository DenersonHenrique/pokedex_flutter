// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_detail_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PokemonDetailController on _PokemonDetailControllerBase, Store {
  Computed<Specie> _$specieComputed;

  @override
  Specie get specie =>
      (_$specieComputed ??= Computed<Specie>(() => super.specie,
              name: '_PokemonDetailControllerBase.specie'))
          .value;
  Computed<PokemonDetailEntity> _$pokemonDetailEntityComputed;

  @override
  PokemonDetailEntity get pokemonDetailEntity =>
      (_$pokemonDetailEntityComputed ??= Computed<PokemonDetailEntity>(
              () => super.pokemonDetailEntity,
              name: '_PokemonDetailControllerBase.pokemonDetailEntity'))
          .value;
  Computed<double> _$getProgressComputed;

  @override
  double get getProgress =>
      (_$getProgressComputed ??= Computed<double>(() => super.getProgress,
              name: '_PokemonDetailControllerBase.getProgress'))
          .value;
  Computed<double> _$getOpacityComputed;

  @override
  double get getOpacity =>
      (_$getOpacityComputed ??= Computed<double>(() => super.getOpacity,
              name: '_PokemonDetailControllerBase.getOpacity'))
          .value;
  Computed<double> _$getMultipleComputed;

  @override
  double get getMultiple =>
      (_$getMultipleComputed ??= Computed<double>(() => super.getMultiple,
              name: '_PokemonDetailControllerBase.getMultiple'))
          .value;
  Computed<double> _$getOpacityTitleAppBarComputed;

  @override
  double get getOpacityTitleAppBar => (_$getOpacityTitleAppBarComputed ??=
          Computed<double>(() => super.getOpacityTitleAppBar,
              name: '_PokemonDetailControllerBase.getOpacityTitleAppBar'))
      .value;

  final _$_specieAtom = Atom(name: '_PokemonDetailControllerBase._specie');

  @override
  Specie get _specie {
    _$_specieAtom.reportRead();
    return super._specie;
  }

  @override
  set _specie(Specie value) {
    _$_specieAtom.reportWrite(value, super._specie, () {
      super._specie = value;
    });
  }

  final _$_pokemonDetailEntityAtom =
      Atom(name: '_PokemonDetailControllerBase._pokemonDetailEntity');

  @override
  PokemonDetailEntity get _pokemonDetailEntity {
    _$_pokemonDetailEntityAtom.reportRead();
    return super._pokemonDetailEntity;
  }

  @override
  set _pokemonDetailEntity(PokemonDetailEntity value) {
    _$_pokemonDetailEntityAtom.reportWrite(value, super._pokemonDetailEntity,
        () {
      super._pokemonDetailEntity = value;
    });
  }

  final _$_progressAtom = Atom(name: '_PokemonDetailControllerBase._progress');

  @override
  double get _progress {
    _$_progressAtom.reportRead();
    return super._progress;
  }

  @override
  set _progress(double value) {
    _$_progressAtom.reportWrite(value, super._progress, () {
      super._progress = value;
    });
  }

  final _$_opacityAtom = Atom(name: '_PokemonDetailControllerBase._opacity');

  @override
  double get _opacity {
    _$_opacityAtom.reportRead();
    return super._opacity;
  }

  @override
  set _opacity(double value) {
    _$_opacityAtom.reportWrite(value, super._opacity, () {
      super._opacity = value;
    });
  }

  final _$_multipleAtom = Atom(name: '_PokemonDetailControllerBase._multiple');

  @override
  double get _multiple {
    _$_multipleAtom.reportRead();
    return super._multiple;
  }

  @override
  set _multiple(double value) {
    _$_multipleAtom.reportWrite(value, super._multiple, () {
      super._multiple = value;
    });
  }

  final _$_opacityTitleAppBarAtom =
      Atom(name: '_PokemonDetailControllerBase._opacityTitleAppBar');

  @override
  double get _opacityTitleAppBar {
    _$_opacityTitleAppBarAtom.reportRead();
    return super._opacityTitleAppBar;
  }

  @override
  set _opacityTitleAppBar(double value) {
    _$_opacityTitleAppBarAtom.reportWrite(value, super._opacityTitleAppBar, () {
      super._opacityTitleAppBar = value;
    });
  }

  final _$getInfoPokemonAsyncAction =
      AsyncAction('_PokemonDetailControllerBase.getInfoPokemon');

  @override
  Future<void> getInfoPokemon(int id) {
    return _$getInfoPokemonAsyncAction.run(() => super.getInfoPokemon(id));
  }

  final _$getInfoSpecieAsyncAction =
      AsyncAction('_PokemonDetailControllerBase.getInfoSpecie');

  @override
  Future<void> getInfoSpecie(String numPokemon) {
    return _$getInfoSpecieAsyncAction
        .run(() => super.getInfoSpecie(numPokemon));
  }

  final _$_PokemonDetailControllerBaseActionController =
      ActionController(name: '_PokemonDetailControllerBase');

  @override
  void setProgress(double progress) {
    final _$actionInfo = _$_PokemonDetailControllerBaseActionController
        .startAction(name: '_PokemonDetailControllerBase.setProgress');
    try {
      return super.setProgress(progress);
    } finally {
      _$_PokemonDetailControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setOpacity(double opacity) {
    final _$actionInfo = _$_PokemonDetailControllerBaseActionController
        .startAction(name: '_PokemonDetailControllerBase.setOpacity');
    try {
      return super.setOpacity(opacity);
    } finally {
      _$_PokemonDetailControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setMultiple(double multiple) {
    final _$actionInfo = _$_PokemonDetailControllerBaseActionController
        .startAction(name: '_PokemonDetailControllerBase.setMultiple');
    try {
      return super.setMultiple(multiple);
    } finally {
      _$_PokemonDetailControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setOpacityTitleAppBar(double opacityTitleAppBar) {
    final _$actionInfo =
        _$_PokemonDetailControllerBaseActionController.startAction(
            name: '_PokemonDetailControllerBase.setOpacityTitleAppBar');
    try {
      return super.setOpacityTitleAppBar(opacityTitleAppBar);
    } finally {
      _$_PokemonDetailControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setSlidingSheet(double stateProgress) {
    final _$actionInfo = _$_PokemonDetailControllerBaseActionController
        .startAction(name: '_PokemonDetailControllerBase.setSlidingSheet');
    try {
      return super.setSlidingSheet(stateProgress);
    } finally {
      _$_PokemonDetailControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
specie: ${specie},
pokemonDetailEntity: ${pokemonDetailEntity},
getProgress: ${getProgress},
getOpacity: ${getOpacity},
getMultiple: ${getMultiple},
getOpacityTitleAppBar: ${getOpacityTitleAppBar}
    ''';
  }
}
