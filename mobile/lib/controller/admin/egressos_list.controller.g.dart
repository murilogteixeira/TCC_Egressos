// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'egressos_list.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EgressosListController on _EgressosListControllerBase, Store {
  final _$egressosAtom = Atom(name: '_EgressosListControllerBase.egressos');

  @override
  ObservableList<Egresso> get egressos {
    _$egressosAtom.reportRead();
    return super.egressos;
  }

  @override
  set egressos(ObservableList<Egresso> value) {
    _$egressosAtom.reportWrite(value, super.egressos, () {
      super.egressos = value;
    });
  }

  final _$egressosFilteredAtom =
      Atom(name: '_EgressosListControllerBase.egressosFiltered');

  @override
  ObservableList<Egresso> get egressosFiltered {
    _$egressosFilteredAtom.reportRead();
    return super.egressosFiltered;
  }

  @override
  set egressosFiltered(ObservableList<Egresso> value) {
    _$egressosFilteredAtom.reportWrite(value, super.egressosFiltered, () {
      super.egressosFiltered = value;
    });
  }

  final _$fetchEgressosAsyncAction =
      AsyncAction('_EgressosListControllerBase.fetchEgressos');

  @override
  Future fetchEgressos() {
    return _$fetchEgressosAsyncAction.run(() => super.fetchEgressos());
  }

  @override
  String toString() {
    return '''
egressos: ${egressos},
egressosFiltered: ${egressosFiltered}
    ''';
  }
}
