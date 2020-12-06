// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
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

  @override
  String toString() {
    return '''
producoes: ${producoes},
mediaProducoes: ${mediaProducoes}
    ''';
  }
}
