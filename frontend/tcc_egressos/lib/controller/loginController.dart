import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tcc_egressos/model/usuario.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'package:mobx/mobx.dart';
import 'package:tcc_egressos/view/login_view.dart';
part 'loginController.g.dart';

class NewLoginController = _NewLoginControllerBase with _$NewLoginController;

abstract class _NewLoginControllerBase with Store {
  @observable
  bool loading = false;

  @action
  setLoading(newValue) => this.loading = newValue;

  @observable
  Usuario usuario;

  var usuarioKey = 'usuario';

  @action
  Future<Usuario> getUsuario() async {
    if (usuario != null) {
      return usuario;
    } else {
      return await _getCacheLogin();
    }
  }

  @action
  setUsuario(Usuario usuario) {
    this.usuario = usuario;
    _salvarCacheLogin();
  }

  Future<Usuario> efetuarLogin(String email, String senha) async {
    var usuarioEncontrado = await _performLogin(email, senha);
    if (usuarioEncontrado != null) {
      setUsuario(usuarioEncontrado);
    }
    return usuarioEncontrado;
  }

  Future<Usuario> _performLogin(String username, String password) async {
    final url = 'https://egressosbackend.herokuapp.com/api/login/';
    var json = {
      'username': username,
      'password': password,
    };

    final response = await http.post(
      url,
      headers: {
        'Authorization': 'Token b3240e032bcf3df07185f34322c0f10b65a267e1',
      },
      body: jsonEncode(json),
    );

    if (response.statusCode == 200) {
      var body = decodeUTF8(response.bodyBytes);
      var json = jsonDecode(body);
      if (json['status'] == false) return null;
      var usuarioResponse = Usuario.fromJson(json);
      return usuarioResponse.status ? usuarioResponse : null;
    } else {
      print('Erro ao realizar login');
    }
    return null;
  }

  logout(BuildContext context) async {
    var prefs = await SharedPreferences.getInstance();
    this.usuario = null;
    prefs.setString(usuarioKey, null);
    Navigator.of(context)
        .pushNamedAndRemoveUntil(LoginView.route, (route) => false);
  }

  Future<Usuario> _getCacheLogin() async {
    var prefs = await SharedPreferences.getInstance();
    var usuarioString = prefs.getString(usuarioKey);
    if (usuarioString == null) return null;
    var jsonDecoded = jsonDecode(usuarioString);
    this.usuario = Usuario.fromJson(jsonDecoded);
    return usuario;
  }

  _salvarCacheLogin() async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setString(usuarioKey, jsonEncode(usuario.toJson()));
  }

  String decodeUTF8(string) {
    return utf8.decode(string);
  }
}
