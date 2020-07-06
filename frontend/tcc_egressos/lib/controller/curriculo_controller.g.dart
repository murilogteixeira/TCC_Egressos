// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'curriculo_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CurriculoController on _CurriculoControllerBase, Store {
  final _$listaWidgetAtom = Atom(name: '_CurriculoControllerBase.listaWidget');

  @override
  ObservableList<Widget> get listaWidget {
    _$listaWidgetAtom.reportRead();
    return super.listaWidget;
  }

  @override
  set listaWidget(ObservableList<Widget> value) {
    _$listaWidgetAtom.reportWrite(value, super.listaWidget, () {
      super.listaWidget = value;
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
listaWidget: ${listaWidget},
container: ${container}
    ''';
  }
}
