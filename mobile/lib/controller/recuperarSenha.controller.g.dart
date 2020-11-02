// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recuperarSenha.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RecuperarSenhaController on _RecuperarSenhaControllerBase, Store {
  final _$isLoadingAtom = Atom(name: '_RecuperarSenhaControllerBase.isLoading');

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

  final _$_RecuperarSenhaControllerBaseActionController =
      ActionController(name: '_RecuperarSenhaControllerBase');

  @override
  dynamic setIsLoading(dynamic value) {
    final _$actionInfo = _$_RecuperarSenhaControllerBaseActionController
        .startAction(name: '_RecuperarSenhaControllerBase.setIsLoading');
    try {
      return super.setIsLoading(value);
    } finally {
      _$_RecuperarSenhaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading}
    ''';
  }
}
