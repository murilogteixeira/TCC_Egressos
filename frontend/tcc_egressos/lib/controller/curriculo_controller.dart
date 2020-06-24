import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'curriculo_controller.g.dart';

class CurriculoController = _CurriculoControllerBase with _$CurriculoController;

abstract class _CurriculoControllerBase with Store {
  @observable
  ObservableList<Widget> listaWidget = ObservableList();

  @observable
  Widget container = Container();

  @action
  setContainer(value) => container = value;

}
