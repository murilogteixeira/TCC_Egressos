// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$listaAtom = Atom(name: '_HomeControllerBase.lista');

  @override
  ObservableList<CurriculoLattes> get lista {
    _$listaAtom.reportRead();
    return super.lista;
  }

  @override
  set lista(ObservableList<CurriculoLattes> value) {
    _$listaAtom.reportWrite(value, super.lista, () {
      super.lista = value;
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

  final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

  @override
  dynamic addCurriculo(CurriculoLattes curriculo) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.addCurriculo');
    try {
      return super.addCurriculo(curriculo);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
lista: ${lista}
    ''';
  }
}
