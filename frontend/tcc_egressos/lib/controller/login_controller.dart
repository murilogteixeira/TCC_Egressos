import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tcc_egressos/model/usuario.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'package:mobx/mobx.dart';
import 'package:tcc_egressos/view/login_view.dart';
part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  @observable
  bool loading = false;
  @action
  setLoading(value) => loading = value;

  @observable
  Usuario _usuario;

  var usuarioKey = 'usuario';

  Future<Usuario> efetuarLogin(String email, String senha) async {
    var usuarioEncontrado = await _performLogin(email, senha);
    if (usuarioEncontrado != null) {
      setUsusario(usuarioEncontrado);
    }
    return usuarioEncontrado;
  }

  logout(BuildContext context) async {
    var prefs = await SharedPreferences.getInstance();
    this._usuario = null;
    prefs.setString(usuarioKey, null);
    Navigator.of(context)
        .pushNamedAndRemoveUntil(LoginView.route, (route) => false);
  }

  Future<Usuario> _performLogin(String username, String password) async {
    final uri = 'https://egressosbackend.herokuapp.com/api/login/';
    var json = {
      'username': username,
      'password': password,
    };

    final response = await http.post(
      uri,
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
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

  Future<Usuario> get usuario async {
    if (_usuario != null) {
      return _usuario;
    } else {
      return await _getCacheLogin();
    }
  }

  @action
  setUsusario(Usuario usuario) {
    this._usuario = usuario;
    _salvarCacheLogin();
  }

  Future<Usuario> _getCacheLogin() async {
    var prefs = await SharedPreferences.getInstance();
    var usuarioString = prefs.getString(usuarioKey);
    if (usuarioString == null) return null;
    var jsonDecoded = jsonDecode(usuarioString);
    _usuario = Usuario.fromJson(jsonDecoded);
    return _usuario;
  }

  _salvarCacheLogin() async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setString(usuarioKey, jsonEncode(_usuario.toJson()));
  }
}

String decodeUTF8(string) {
  return utf8.decode(string);
}
