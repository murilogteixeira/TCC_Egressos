import 'dart:convert';

import 'package:mobile/helpers/enum/funcao.dart';
import 'package:mobile/model/curriculo_lattes/curriculo_lattes.dart';
import 'package:mobile/model/curriculo_lattes/endereco.dart';
import 'package:mobile/model/curriculo_lattes/situacao.dart';
import 'package:mobile/model/usuario.model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:mobx/mobx.dart';
part 'login.controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {

  @observable
  bool loading = true;
  @action
  setLoading(value) => loading = value;

  static var curriculo = CurriculoLattes(
    celular: '',
    dataNasc: DateTime.now(),
    descricao: '',
    email: '',
    endereco: Endereco(bairro: '', cep: '', cidade: '', uf: ''),
    id: 1,
    lattesID: '',
    nome: '',
    nomeCitacao: '',
    situacao: Situacao(id: 1, tipo: ''),
  );

  List<UsuarioModel> usuarios = [
    UsuarioModel(
      email: 'egresso@mail.com',
      senha: '123',
      nome: "Egresso",
      curriculo: curriculo,
      funcao: Funcao.egresso,
    ),
    UsuarioModel(
      email: 'admin@mail.com',
      senha: '123',
      nome: "Admin",
      curriculo: curriculo,
      funcao: Funcao.admin,
    ),
  ];

  UsuarioModel _usuario;
  var _usuarioKey = 'usuario';

  UsuarioModel efetuarLogin(String email, String senha) {
    var usuarioEncontrado = procurarEmail(email);
    if (usuarioEncontrado != null && usuarioEncontrado.senha == senha) {
      setUsusario(usuarioEncontrado);
    }
    return usuarioEncontrado;
  }

  logout() async {
    var prefs = await SharedPreferences.getInstance();
    this._usuario = null;
    prefs.setString(_usuarioKey, null);
  }

  UsuarioModel procurarEmail(email) {
    return usuarios.firstWhere((element) => element.email == email);
  }

  Future<UsuarioModel> get usuario async {
    if (_usuario != null) {
      return _usuario;
    } else {
      return await _getCacheLogin();
    }
  }

  setUsusario(UsuarioModel usuario) {
    this._usuario = usuario;
    _salvarCacheLogin();
  }

  Future<UsuarioModel> _getCacheLogin() async {
    var prefs = await SharedPreferences.getInstance();
    var usuarioString = prefs.getString(_usuarioKey);
    if (usuarioString == null) return null;
    _usuario = UsuarioModel.fromJson(jsonDecode(usuarioString));
    return _usuario;
  }

  _salvarCacheLogin() async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setString(_usuarioKey, jsonEncode(_usuario.toJson()));
  }
}
