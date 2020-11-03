part of 'egresso_controller.dart';

mixin _$EgressoController on _EgressoControllerBase, Store {
  final _$egressoAtom = Atom(name: '_EgressoControllerBase.egresso');

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

  final _$containerAtom = Atom(name: '_EgressoControllerBase.container');

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

  final _$_EgressoControllerBaseActionController =
      ActionController(name: '_EgressoControllerBase');

  @override
  dynamic setEgresso(dynamic value) {
    final _$actionInfo = _$_EgressoControllerBaseActionController.startAction(
        name: '_EgressoControllerBase.setEgresso');
    try {
      return super.setEgresso(value);
    } finally {
      _$_EgressoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setContainer(dynamic value) {
    final _$actionInfo = _$_EgressoControllerBaseActionController.startAction(
        name: '_CurriculoControllerBase.setContainer');
    try {
      return super.setContainer(value);
    } finally {
      _$_EgressoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
  egresso: ${egresso},
  container: ${container}
    ''';
  }
}
