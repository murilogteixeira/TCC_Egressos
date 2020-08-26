import 'package:mobx/mobx.dart';
import 'package:tcc_egressos/components/menu_botao_widget.dart';

part 'menu_botao_widget_controller.g.dart';

class MenuBotaoWidgetController = _MenuBotaoWidgetControllerBase
    with _$MenuBotaoWidgetController;

abstract class _MenuBotaoWidgetControllerBase with Store {
  _MenuBotaoWidgetControllerBase({this.ativo});
  @observable
  bool ativo;
  @action
  setAtivo(value) => ativo = value;
}
