// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'curriculo_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CurriculoController on _CurriculoControllerBase, Store {
  final _$curriculoAtom = Atom(name: '_CurriculoControllerBase.curriculo');

  @override
  CurriculoLattes get curriculo {
    _$curriculoAtom.reportRead();
    return super.curriculo;
  }

  @override
  set curriculo(CurriculoLattes value) {
    _$curriculoAtom.reportWrite(value, super.curriculo, () {
      super.curriculo = value;
    });
  }

  final _$containerAtom = Atom(name: '_CurriculoControllerBase.container');

  @override
  Widget get container {
    _$containerAtom.reportRead();
    return super.container;
  }

  @override
  set container(Widget value) {
    _$containerAtom.reportWrite(value, super.container, () {
      super.container = value;
    });
  }

  final _$_CurriculoControllerBaseActionController =
      ActionController(name: '_CurriculoControllerBase');

  @override
  dynamic setCurriculo(dynamic value) {
    final _$actionInfo = _$_CurriculoControllerBaseActionController.startAction(
        name: '_CurriculoControllerBase.setCurriculo');
    try {
      return super.setCurriculo(value);
    } finally {
      _$_CurriculoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setContainer(dynamic value) {
    final _$actionInfo = _$_CurriculoControllerBaseActionController.startAction(
        name: '_CurriculoControllerBase.setContainer');
    try {
      return super.setContainer(value);
    } finally {
      _$_CurriculoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
curriculo: ${curriculo},
container: ${container}
    ''';
  }
}
