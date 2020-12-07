import 'package:mobile/helpers/service/network.dart';
import 'package:mobile/helpers/url.dart';
import 'package:mobile/model/curriculo_lattes/egresso.dart';
import 'package:mobx/mobx.dart';
part 'editar_perfil.controller.g.dart';

class EditarPerfilController = _EditarPerfilControllerBase
    with _$EditarPerfilController;

abstract class _EditarPerfilControllerBase with Store {
  _EditarPerfilControllerBase(this.egresso);

  @observable
  Egresso egresso;

  @observable
  bool isLoading = false;

  @action
  setEgresso(value) => egresso = value;

  @action
  updateEgresso() async {
    final url = BaseURL.shared.updateEgresso(egresso.id);

    isLoading = true;
    var json = await Network().putApi(url, egresso.toJson());
    isLoading = false;
    print('json: $json');
    print('egresso: ${egresso.toJson()}');
    if (json == null) return null;
  }
}
