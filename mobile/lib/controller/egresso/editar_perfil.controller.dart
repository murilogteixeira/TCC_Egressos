import 'package:mobile/helpers/service/network.dart';
import 'package:mobile/model/curriculo_lattes/egresso.dart';
import 'package:mobx/mobx.dart';
part 'editar_perfil.controller.g.dart';

class EditarPerfilController = _EditarPerfilControllerBase
    with _$EditarPerfilController;

abstract class _EditarPerfilControllerBase with Store {
  _EditarPerfilControllerBase(this.egresso);

  @observable
  Egresso egresso;

  @action
  setEgresso(value) => egresso = value;

  updateEgresso() async {
    final url = '';

    var json = await Network().putApi(url, egresso.toJson());
    if (json == null) return null;
  }
}
