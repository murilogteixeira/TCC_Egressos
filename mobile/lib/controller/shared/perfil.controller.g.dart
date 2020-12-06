// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'perfil.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PerfilController on _PerfilControllerBase, Store {
  final _$egressoAtom = Atom(name: '_PerfilControllerBase.egresso');

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

  final _$informacoesEgressoAtom =
      Atom(name: '_PerfilControllerBase.informacoesEgresso');

  @override
  Widget get informacoesEgresso {
    _$informacoesEgressoAtom.reportRead();
    return super.informacoesEgresso;
  }

  @override
  set informacoesEgresso(Widget value) {
    _$informacoesEgressoAtom.reportWrite(value, super.informacoesEgresso, () {
      super.informacoesEgresso = value;
    });
  }

  final _$getPerfilAsyncAction = AsyncAction('_PerfilControllerBase.getPerfil');

  @override
  Future<dynamic> getPerfil() {
    return _$getPerfilAsyncAction.run(() => super.getPerfil());
  }

  final _$_PerfilControllerBaseActionController =
      ActionController(name: '_PerfilControllerBase');

  @override
  dynamic setEgresso(dynamic value) {
    final _$actionInfo = _$_PerfilControllerBaseActionController.startAction(
        name: '_PerfilControllerBase.setEgresso');
    try {
      return super.setEgresso(value);
    } finally {
      _$_PerfilControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setInformacoesEgresso(dynamic value) {
    final _$actionInfo = _$_PerfilControllerBaseActionController.startAction(
        name: '_PerfilControllerBase.setInformacoesEgresso');
    try {
      return super.setInformacoesEgresso(value);
    } finally {
      _$_PerfilControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
egresso: ${egresso},
informacoesEgresso: ${informacoesEgresso}
    ''';
  }
}
