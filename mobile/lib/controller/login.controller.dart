import 'dart:convert';

import 'package:mobile/helpers/enum/funcao.dart';
import 'package:mobile/model/curriculo_lattes/egresso.dart';
import 'package:mobile/model/curriculo_lattes/endereco.dart';
import 'package:mobile/model/curriculo_lattes/situacao.dart';
import 'package:mobile/model/usuario.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'package:mobx/mobx.dart';
part 'login.controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  @observable
  bool loading = true;
  @action
  setLoading(value) => loading = value;

  List<Usuario> usuarios = [
    Usuario(
      isStaff: false,
      status: null,
      egresso: Egresso(
        id: 1,
        nome: '',
        idLattes: '',
        nomeCitacoes: '',
        celular: '',
        dNasc: '',
        email: '',
        endereco: Endereco(id: 1, bairro: '', cep: '', estado: '', uf: ''),
        situacao: Situacao(id: 1, tipo: ''),
      ),
    ),
    Usuario(
      isStaff: true,
      status: null,
      egresso: null,
    ),
  ];

  Usuario _usuario;
  var usuarioKey = 'usuario';

  Future<Usuario> efetuarLogin(String email, String senha) async {
    var usuarioEncontrado = await _performLogin(email, senha);
    if (usuarioEncontrado != null) {
      setUsusario(usuarioEncontrado);
    }
    return usuarioEncontrado;
  }

  logout() async {
    var prefs = await SharedPreferences.getInstance();
    this._usuario = null;
    prefs.setString(usuarioKey, null);
  }

  Future<Usuario> _performLogin(String username, String password) async {
    final response = await http.post(
      'https://egressosbackend.herokuapp.com/api/login/',
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        {
          'username': username,
          'password': password,
        },
      ),
    );

    if (response.statusCode == 200) {
      var usuarioResponse = Usuario.fromJson(json.decode(response.body));
      return usuarioResponse.status ? usuarioResponse : null;
    } else {
      print('Erro ao realizar login');
    }
    return null;
  }

  Usuario procurarEmail(email) {
    return usuarios.firstWhere((element) => element.egresso.email == email);
  }

  Future<Usuario> get usuario async {
    if (_usuario != null) {
      return _usuario;
    } else {
      return await _getCacheLogin();
    }
  }

  setUsusario(Usuario usuario) {
    this._usuario = usuario;
    _salvarCacheLogin();
  }

  Future<Usuario> _getCacheLogin() async {
    var prefs = await SharedPreferences.getInstance();
    var usuarioString = prefs.getString(usuarioKey);
    if (usuarioString == null) return null;
    _usuario = Usuario.fromJson(jsonDecode(usuarioString));
    return _usuario;
  }

  _salvarCacheLogin() async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setString(usuarioKey, jsonEncode(_usuario.toJson()));
  }
}
