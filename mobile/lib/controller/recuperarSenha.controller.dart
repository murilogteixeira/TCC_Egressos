import 'package:mobx/mobx.dart';
part 'recuperarSenha.controller.g.dart';

class RecuperarSenhaController = _RecuperarSenhaControllerBase
    with _$RecuperarSenhaController;

abstract class _RecuperarSenhaControllerBase with Store {
  @observable
  var isLoading = false;

  @action
  setIsLoading(value) => isLoading = value;
}
