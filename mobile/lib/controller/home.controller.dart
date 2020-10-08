import 'package:mobile/controller/login.controller.dart';
import 'package:mobile/model/curriculo_lattes/banca/banca.dart';
import 'package:mobile/model/curriculo_lattes/producao/producao.dart';
import 'package:mobx/mobx.dart';
part 'home.controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  _HomeControllerBase() {
    _fetchProducoes();
    // _fetchBancas();
  }

  @observable
  ObservableList<Producao> producoes = <Producao>[].asObservable();

  @observable
  ObservableList<int> mediaProducoes = <int>[].asObservable();

  @observable
  ObservableList<Banca> bancas = <Banca>[].asObservable();

  @observable
  ObservableList<int> mediaBancas = <int>[].asObservable();

  _fetchProducoes() async {
    var controller = LoginController();
    var usuario = await controller.usuario;
    var egresso = usuario.egresso;
    List<Producao> _producoes =
        await controller.getProducoesEgresso(egresso.id);
    _producoes.forEach((element) {
      producoes.add(element);
    });
  }

  _fetchBancas() async {
    var controller = LoginController();
    var usuario = await controller.usuario;
    var egresso = usuario.egresso;
    List<Banca> _bancas =
        await controller.getBancasEgresso(egresso.id);
    _bancas.forEach((element) {
      bancas.add(element);
    });
  }
}
