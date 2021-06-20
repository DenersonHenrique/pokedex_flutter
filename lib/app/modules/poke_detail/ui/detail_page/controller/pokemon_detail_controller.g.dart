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

  @override
  String toString() {
    return '''
specie: ${specie},
pokemonDetailEntity: ${pokemonDetailEntity}
    ''';
  }
}
