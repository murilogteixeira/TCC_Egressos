// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resultado_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ResultadoController on _ResultadoControllerBase, Store {
  final _$paginaAtualAtom = Atom(name: '_ResultadoControllerBase.paginaAtual');

  @override
  int get paginaAtual {
    _$paginaAtualAtom.reportRead();
    return super.paginaAtual;
  }

  @override
  set paginaAtual(int value) {
    _$paginaAtualAtom.reportWrite(value, super.paginaAtual, () {
      super.paginaAtual = value;
    });
  }

  final _$listaAtom = Atom(name: '_ResultadoControllerBase.lista');

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

  final _$_ResultadoControllerBaseActionController =
      ActionController(name: '_ResultadoControllerBase');

  @override
  dynamic setPaginaAtual(dynamic value) {
    final _$actionInfo = _$_ResultadoControllerBaseActionController.startAction(
        name: '_ResultadoControllerBase.setPaginaAtual');
    try {
      return super.setPaginaAtual(value);
    } finally {
      _$_ResultadoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
paginaAtual: ${paginaAtual},
lista: ${lista}
    ''';
  }
}
