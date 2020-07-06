// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'endereco.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Endereco on _EnderecoBase, Store {
  final _$cepAtom = Atom(name: '_EnderecoBase.cep');

  @override
  String get cep {
    _$cepAtom.reportRead();
    return super.cep;
  }

  @override
  set cep(String value) {
    _$cepAtom.reportWrite(value, super.cep, () {
      super.cep = value;
    });
  }

  final _$bairroAtom = Atom(name: '_EnderecoBase.bairro');

  @override
  String get bairro {
    _$bairroAtom.reportRead();
    return super.bairro;
  }

  @override
  set bairro(String value) {
    _$bairroAtom.reportWrite(value, super.bairro, () {
      super.bairro = value;
    });
  }

  final _$cidadeAtom = Atom(name: '_EnderecoBase.cidade');

  @override
  String get cidade {
    _$cidadeAtom.reportRead();
    return super.cidade;
  }

  @override
  set cidade(String value) {
    _$cidadeAtom.reportWrite(value, super.cidade, () {
      super.cidade = value;
    });
  }

  final _$ufAtom = Atom(name: '_EnderecoBase.uf');

  @override
  String get uf {
    _$ufAtom.reportRead();
    return super.uf;
  }

  @override
  set uf(String value) {
    _$ufAtom.reportWrite(value, super.uf, () {
      super.uf = value;
    });
  }

  final _$_EnderecoBaseActionController =
      ActionController(name: '_EnderecoBase');

  @override
  dynamic setCep(dynamic value) {
    final _$actionInfo = _$_EnderecoBaseActionController.startAction(
        name: '_EnderecoBase.setCep');
    try {
      return super.setCep(value);
    } finally {
      _$_EnderecoBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setBairro(dynamic value) {
    final _$actionInfo = _$_EnderecoBaseActionController.startAction(
        name: '_EnderecoBase.setBairro');
    try {
      return super.setBairro(value);
    } finally {
      _$_EnderecoBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setCidade(dynamic value) {
    final _$actionInfo = _$_EnderecoBaseActionController.startAction(
        name: '_EnderecoBase.setCidade');
    try {
      return super.setCidade(value);
    } finally {
      _$_EnderecoBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setUF(dynamic value) {
    final _$actionInfo = _$_EnderecoBaseActionController.startAction(
        name: '_EnderecoBase.setUF');
    try {
      return super.setUF(value);
    } finally {
      _$_EnderecoBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
cep: ${cep},
bairro: ${bairro},
cidade: ${cidade},
uf: ${uf}
    ''';
  }
}
