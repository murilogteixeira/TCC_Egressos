import 'package:mobile/helpers/service/network.dart';
import 'package:mobile/helpers/url.dart';
import 'package:mobile/model/curriculo_lattes/egresso.dart';

import 'package:mobile/model/curriculo_lattes/producao/producao.dart';

import 'package:mobx/mobx.dart';
part 'producoes.controller.g.dart';

class ProducoesController = _ProducoesControllerBase with _$ProducoesController;

abstract class _ProducoesControllerBase with Store {
  final Egresso egresso;

  _ProducoesControllerBase({this.egresso}) {
    getListAvarages(egresso.id);
  }

  @observable
  bool isLoading = true;

  // @observable
  // ObservableList<Producao> producoes = <Producao>[].asObservable();

  @observable
  ObservableList<MediaProducao> mediaProducoes =
      <MediaProducao>[].asObservable();

  @action
  Future<void> fetchData(int id) async {
    print('Buscando produções do egresso: $id');
    isLoading = true;
    // await getProducoesEgresso(id);
    await getListAvarages(id);
    isLoading = false;
    return;
  }

  // @action
  // Future<List<Producao>> getProducoesEgresso(int id) async {
  //   final url = BaseURL.shared.getProducoes(id);

  //   List json = await Network().getApi(url);
  //   if (json == null) return null;
  //   producoes.removeWhere((element) => true);
  //   json.forEach((e) => producoes.add(Producao.fromJson(e)));
  //   return producoes;
  // }

  @action
  Future<List<MediaProducao>> getListAvarages(int id) async {
    final url = BaseURL.shared.getMediaProducoes(id);

    var json = await Network().getApi(url);
    if (json == null) return null;
    if (json['status'] == false) return null;
    List mediasJson = json['media'];
    mediaProducoes.removeWhere((element) => true);
    mediasJson.forEach((e) => mediaProducoes.add(MediaProducao.fromJson(e)));
    return mediaProducoes;
  }
}

class MediaProducao {
  int media;
  int egresso;
  String tipo;
  int tipoId;

  MediaProducao({this.media, this.egresso, this.tipo, this.tipoId});

  MediaProducao.fromJson(Map<String, dynamic> json) {
    media = json['media'];
    egresso = json['egresso'];
    tipo = json['tipo'];
    tipoId = json['tipo_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['media'] = this.media;
    data['egresso'] = this.egresso;
    data['tipo'] = this.tipo;
    data['tipo_id'] = this.tipoId;
    return data;
  }
}
