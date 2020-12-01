import 'package:mobile/controller/egresso/producoes.controller.dart';
import 'package:mobile/model/curriculo_lattes/banca/banca.dart';
import 'package:mobile/model/curriculo_lattes/egresso.dart';
import 'package:mobile/model/curriculo_lattes/producao/producao.dart';
import 'package:mobx/mobx.dart';

part 'home.controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final Egresso egresso;

  _HomeControllerBase({this.egresso}) {
    fetchProducoes();
    fetchMedias();
  }

  @observable
  ObservableList<Producao> producoes = <Producao>[].asObservable();

  @observable
  ObservableList<MediaProducao> mediaProducoes =
      <MediaProducao>[].asObservable();

  @observable
  ObservableList<Banca> bancas = <Banca>[].asObservable();

  @observable
  ObservableList<int> mediaBancas = <int>[].asObservable();

  fetchProducoes() async {
    // var loginController = LoginController();
    var producoesController = ProducoesController();
    // var usuario = await loginController.usuario;
    // var egresso = usuario.egresso;
    List<Producao> _producoes =
        await producoesController.getProducoesEgresso(egresso.id);
    if (_producoes == null) {
      print('Producoes null');
      return;
    }
    _producoes.forEach((element) {
      producoes.add(element);
    });
    return producoes;
  }

  Future<List<MediaProducao>> fetchMedias() async {
    // var loginController = LoginController();
    var producoesController = ProducoesController();
    // var usuario = await loginController.usuario;
    // var egresso = usuario.egresso;
    mediaProducoes.removeWhere((element) => true);
    List<MediaProducao> _medias =
        await producoesController.getListAvarages(egresso.id);
    _medias.forEach((element) {
      mediaProducoes.add(element);
    });
    return mediaProducoes;
  }
}
