// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'situacao.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Situacao on _SituacaoBase, Store {
  final _$idAtom = Atom(name: '_SituacaoBase.id');

  @override
  int get id {
    _$idAtom.reportRead();
    return super.id;
  }

  @override
  set id(int value) {
    _$idAtom.reportWrite(value, super.id, () {
      super.id = value;
    });
  }

  final _$tipoAtom = Atom(name: '_SituacaoBase.tipo');

  @override
  String get tipo {
    _$tipoAtom.reportRead();
    return super.tipo;
  }

  @override
  set tipo(String value) {
    _$tipoAtom.reportWrite(value, super.tipo, () {
      super.tipo = value;
    });
  }

  final _$_SituacaoBaseActionController =
      ActionController(name: '_SituacaoBase');

  @override
  dynamic setId(dynamic value) {
    final _$actionInfo = _$_SituacaoBaseActionController.startAction(
        name: '_SituacaoBase.setId');
    try {
      return super.setId(value);
    } finally {
      _$_SituacaoBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setTipo(dynamic value) {
    final _$actionInfo = _$_SituacaoBaseActionController.startAction(
        name: '_SituacaoBase.setTipo');
    try {
      return super.setTipo(value);
    } finally {
      _$_SituacaoBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
id: ${id},
tipo: ${tipo}
    ''';
  }
}
