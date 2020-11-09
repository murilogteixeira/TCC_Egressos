// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$listaAtom = Atom(name: '_HomeControllerBase.lista');

  @override
  ObservableList<Egresso> get lista {
    _$listaAtom.reportRead();
    return super.lista;
  }

  @override
  set lista(ObservableList<Egresso> value) {
    _$listaAtom.reportWrite(value, super.lista, () {
      super.lista = value;
    });
  }

  final _$producoesAtom = Atom(name: '_HomeControllerBase.producoes');

  @override
  ObservableList<Producao> get producoes {
    _$producoesAtom.reportRead();
    return super.producoes;
  }

  @override
  set producoes(ObservableList<Producao> value) {
    _$producoesAtom.reportWrite(value, super.producoes, () {
      super.producoes = value;
    });
  }

  final _$mediaProducoesAtom = Atom(name: '_HomeControllerBase.mediaProducoes');

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

  final _$bancasAtom = Atom(name: '_HomeControllerBase.bancas');

  @override
  ObservableList<Banca> get bancas {
    _$bancasAtom.reportRead();
    return super.bancas;
  }

  @override
  set bancas(ObservableList<Banca> value) {
    _$bancasAtom.reportWrite(value, super.bancas, () {
      super.bancas = value;
    });
  }

  final _$mediaBancasAtom = Atom(name: '_HomeControllerBase.mediaBancas');

  @override
  ObservableList<int> get mediaBancas {
    _$mediaBancasAtom.reportRead();
    return super.mediaBancas;
  }

  @override
  set mediaBancas(ObservableList<int> value) {
    _$mediaBancasAtom.reportWrite(value, super.mediaBancas, () {
      super.mediaBancas = value;
    });
  }

  final _$consultarAsyncAction = AsyncAction('_HomeControllerBase.consultar');

  @override
  Future consultar(String nome, dynamic doneCallback) {
    return _$consultarAsyncAction
        .run(() => super.consultar(nome, doneCallback));
  }

  final _$buscarTodosAsyncAction =
      AsyncAction('_HomeControllerBase.buscarTodos');

  @override
  Future buscarTodos(dynamic doneCallback) {
    return _$buscarTodosAsyncAction.run(() => super.buscarTodos(doneCallback));
  }

  final _$obterListaSPAsyncAction =
      AsyncAction('_HomeControllerBase.obterListaSP');

  @override
  Future obterListaSP() {
    return _$obterListaSPAsyncAction.run(() => super.obterListaSP());
  }

  final _$obterProducoesAsyncAction =
      AsyncAction('_HomeControllerBase.obterProducoes');

  @override
  Future obterProducoes(int id) {
    return _$obterProducoesAsyncAction.run(() => super.obterProducoes(id));
  }

  final _$obterMediaAsyncAction = AsyncAction('_HomeControllerBase.obterMedia');

  @override
  Future obterMedia(int id) {
    return _$obterMediaAsyncAction.run(() => super.obterMedia(id));
  }

  final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

  @override
  dynamic addEgresso(Egresso egresso) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.addEgresso');
    try {
      return super.addEgresso(egresso);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
lista: ${lista},
producoes: ${producoes},
mediaProducoes: ${mediaProducoes},
bancas: ${bancas},
mediaBancas: ${mediaBancas}
    ''';
  }
}
