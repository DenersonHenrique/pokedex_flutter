// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_detail_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PokemonDetailController on _PokemonDetailControllerBase, Store {
  Computed<PokemonDetailEntity> _$pokemonDetailEntityComputed;

  @override
  PokemonDetailEntity get pokemonDetailEntity =>
      (_$pokemonDetailEntityComputed ??= Computed<PokemonDetailEntity>(
              () => super.pokemonDetailEntity,
              name: '_PokemonDetailControllerBase.pokemonDetailEntity'))
          .value;

  final _$specieAtom = Atom(name: '_PokemonDetailControllerBase.specie');

  @override
  Specie get specie {
    _$specieAtom.reportRead();
    return super.specie;
  }

  @override
  set specie(Specie value) {
    _$specieAtom.reportWrite(value, super.specie, () {
      super.specie = value;
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
