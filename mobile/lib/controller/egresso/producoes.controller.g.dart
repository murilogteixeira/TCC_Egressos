// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'producoes.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProducoesController on _ProducoesControllerBase, Store {
  final _$isLoadingAtom = Atom(name: '_ProducoesControllerBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$mediaProducoesAtom =
      Atom(name: '_ProducoesControllerBase.mediaProducoes');

  @override
  ObservableList<MediaProducao> get mediaProducoes {
    _$mediaProducoesAtom.reportRead();
    return super.mediaProducoes;
  }

  @override
  set mediaProducoes(ObservableList<MediaProducao> value) {
    _$mediaProducoesAtom.reportWrite(value, super.mediaProducoes, () {
      super.mediaProducoes = value;
    });
  }

  final _$fetchDataAsyncAction =
      AsyncAction('_ProducoesControllerBase.fetchData');

  @override
  Future<void> fetchData(int id) {
    return _$fetchDataAsyncAction.run(() => super.fetchData(id));
  }

  final _$getListAvaragesAsyncAction =
      AsyncAction('_ProducoesControllerBase.getListAvarages');

  @override
  Future<List<MediaProducao>> getListAvarages(int id) {
    return _$getListAvaragesAsyncAction.run(() => super.getListAvarages(id));
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
mediaProducoes: ${mediaProducoes}
    ''';
  }
}
