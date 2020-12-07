import 'package:mobile/controller/egresso/producoes.controller.dart';
import 'package:mobile/model/curriculo_lattes/egresso.dart';
import 'package:mobile/model/curriculo_lattes/producao/producao.dart';
import 'package:mobx/mobx.dart';

part 'home.controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  // final Egresso egresso;

  // _HomeControllerBase({this.egresso}) {
  //   fetchData();
  // }

  // @action
  // Future fetchData() async {
  //   await fetchProducoes();
  //   await fetchMedias();
  // }

  // @observable
  // var isLoading = true;

  // @observable
  // ObservableList<Producao> producoes = <Producao>[].asObservable();

  // @observable
  // ObservableList<MediaProducao> mediaProducoes =
  //     <MediaProducao>[].asObservable();

  // fetchProducoes() async {
  //   var producoesController = ProducoesController();
  //   List<Producao> _producoes =
  //       await producoesController.getProducoesEgresso(egresso.id);
  //   if (_producoes == null) {
  //     print('Producoes null');
  //     return;
  //   }
  //   _producoes.forEach((element) {
  //     producoes.add(element);
  //   });
  //   return producoes;
  // }

  // Future<List<MediaProducao>> fetchMedias() async {
  //   var producoesController = ProducoesController();
  //   mediaProducoes.removeWhere((element) => true);
  //   List<MediaProducao> _medias =
  //       await producoesController.getListAvarages(egresso.id);
  //   _medias.forEach((element) {
  //     mediaProducoes.add(element);
  //   });
  //   return mediaProducoes;
  // }
}
