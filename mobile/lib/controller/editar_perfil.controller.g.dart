// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'editar_perfil.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EditarPerfilController on _EditarPerfilControllerBase, Store {
  final _$egressoAtom = Atom(name: '_EditarPerfilControllerBase.egresso');

  @override
  Egresso get egresso {
    _$egressoAtom.reportRead();
    return super.egresso;
  }

  @override
  set egresso(Egresso value) {
    _$egressoAtom.reportWrite(value, super.egresso, () {
      super.egresso = value;
    });
  }

  final _$_EditarPerfilControllerBaseActionController =
      ActionController(name: '_EditarPerfilControllerBase');

  @override
  dynamic setEgresso(dynamic value) {
    final _$actionInfo = _$_EditarPerfilControllerBaseActionController
        .startAction(name: '_EditarPerfilControllerBase.setEgresso');
    try {
      return super.setEgresso(value);
    } finally {
      _$_EditarPerfilControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
egresso: ${egresso}
    ''';
  }
}
