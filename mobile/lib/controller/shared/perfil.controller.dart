import 'package:flutter/material.dart';
import 'package:mobile/helpers/service/network.dart';
import 'package:mobile/helpers/url.dart';
import 'package:mobile/model/curriculo_lattes/egresso.dart';
import 'package:mobile/model/usuario.dart';
import 'package:mobx/mobx.dart';
part 'perfil.controller.g.dart';

class PerfilController = _PerfilControllerBase with _$PerfilController;

abstract class _PerfilControllerBase with Store {
  _PerfilControllerBase({this.egresso});

  @observable
  Egresso egresso;

  @action
  setEgresso(value) => egresso = value;

  @observable
  Widget informacoesEgresso;

  @action
  setInformacoesEgresso(value) => informacoesEgresso = value;

  @action
  Future getPerfil() async {
    var url = BaseURL.shared.getEgresso(egresso.id);

    var json = await Network().getApi(url);
    if (json == null) return null;

    var usuario = Usuario.fromJson(json);
    egresso = usuario.egresso;
  }
}
