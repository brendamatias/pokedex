// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokeapi_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PokeApiStore on _PokeApiStoreBase, Store {
  Computed<PokeAPI> _$pokeAPIComputed;

  @override
  PokeAPI get pokeAPI =>
      (_$pokeAPIComputed ??= Computed<PokeAPI>(() => super.pokeAPI)).value;
  Computed<Pokemon> _$currentPokemonComputed;

  @override
  Pokemon get currentPokemon => (_$currentPokemonComputed ??=
          Computed<Pokemon>(() => super.currentPokemon))
      .value;

  final _$_pokeAPIAtom = Atom(name: '_PokeApiStoreBase._pokeAPI');

  @override
  PokeAPI get _pokeAPI {
    _$_pokeAPIAtom.context.enforceReadPolicy(_$_pokeAPIAtom);
    _$_pokeAPIAtom.reportObserved();
    return super._pokeAPI;
  }

  @override
  set _pokeAPI(PokeAPI value) {
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

  final _$colorPokemonAtom = Atom(name: '_PokeApiStoreBase.colorPokemon');

  @override
  Color get colorPokemon {
    _$colorPokemonAtom.context.enforceReadPolicy(_$colorPokemonAtom);
    _$colorPokemonAtom.reportObserved();
    return super.colorPokemon;
  }

  @override
  set colorPokemon(Color value) {
    _$colorPokemonAtom.context.conditionallyRunInAction(() {
      super.colorPokemon = value;
      _$colorPokemonAtom.reportChanged();
    }, _$colorPokemonAtom, name: '${_$colorPokemonAtom.name}_set');
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
  Widget getImage({String number}) {
    final _$actionInfo = _$_PokeApiStoreBaseActionController.startAction();
    try {
      return super.getImage(number: number);
    } finally {
      _$_PokeApiStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'colorPokemon: ${colorPokemon.toString()},currentPosition: ${currentPosition.toString()},pokeAPI: ${pokeAPI.toString()},currentPokemon: ${currentPokemon.toString()}';
    return '{$string}';
  }
}
