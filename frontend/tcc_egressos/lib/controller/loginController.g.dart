// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loginController.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NewLoginController on _NewLoginControllerBase, Store {
  final _$loadingAtom = Atom(name: '_NewLoginControllerBase.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$usuarioAtom = Atom(name: '_NewLoginControllerBase.usuario');

  @override
  Usuario get usuario {
    _$usuarioAtom.reportRead();
    return super.usuario;
  }

  @override
  set usuario(Usuario value) {
    _$usuarioAtom.reportWrite(value, super.usuario, () {
      super.usuario = value;
    });
  }

  final _$getUsuarioAsyncAction =
      AsyncAction('_NewLoginControllerBase.getUsuario');

  @override
  Future<Usuario> getUsuario() {
    return _$getUsuarioAsyncAction.run(() => super.getUsuario());
  }

  final _$_NewLoginControllerBaseActionController =
      ActionController(name: '_NewLoginControllerBase');

  @override
  dynamic setLoading(dynamic newValue) {
    final _$actionInfo = _$_NewLoginControllerBaseActionController.startAction(
        name: '_NewLoginControllerBase.setLoading');
    try {
      return super.setLoading(newValue);
    } finally {
      _$_NewLoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setUsuario(Usuario usuario) {
    final _$actionInfo = _$_NewLoginControllerBaseActionController.startAction(
        name: '_NewLoginControllerBase.setUsuario');
    try {
      return super.setUsuario(usuario);
    } finally {
      _$_NewLoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
usuario: ${usuario}
    ''';
  }
}
