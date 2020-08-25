// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_botao_widget_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MenuBotaoWidgetController on _MenuBotaoWidgetControllerBase, Store {
  final _$ativoAtom = Atom(name: '_MenuBotaoWidgetControllerBase.ativo');

  @override
  bool get ativo {
    _$ativoAtom.reportRead();
    return super.ativo;
  }

  @override
  set ativo(bool value) {
    _$ativoAtom.reportWrite(value, super.ativo, () {
      super.ativo = value;
    });
  }

  final _$_MenuBotaoWidgetControllerBaseActionController =
      ActionController(name: '_MenuBotaoWidgetControllerBase');

  @override
  dynamic setAtivo(dynamic value) {
    final _$actionInfo = _$_MenuBotaoWidgetControllerBaseActionController
        .startAction(name: '_MenuBotaoWidgetControllerBase.setAtivo');
    try {
      return super.setAtivo(value);
    } finally {
      _$_MenuBotaoWidgetControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
ativo: ${ativo}
    ''';
  }
}
