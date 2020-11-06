import 'package:flutter/material.dart';
import 'package:mobile/controller/shared/login.controller.dart';
import 'package:mobile/model/curriculo_lattes/egresso.dart';
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
}
