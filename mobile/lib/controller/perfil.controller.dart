import 'package:flutter/material.dart';
import 'package:mobile/controller/login.controller.dart';
import 'package:mobile/model/curriculo_lattes/egresso.dart';
import 'package:mobx/mobx.dart';
part 'perfil.controller.g.dart';

class PerfilController = _PerfilControllerBase with _$PerfilController;

abstract class _PerfilControllerBase with Store {
  _PerfilControllerBase() {
    LoginController().usuario.then((value) => egresso = value.egresso);
  }

  @observable
  Egresso egresso;

  @action
  setEgresso(value) => egresso = value;

  @observable
  Widget conteudo;

  @action
  setConteudo(value) => conteudo = value;
}
