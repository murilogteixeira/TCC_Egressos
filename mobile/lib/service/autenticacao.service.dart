import 'dart:convert';

import 'package:mobile/model/usuario.model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AutenticacaoService {
  AutenticacaoService._();

  static final AutenticacaoService _instance = AutenticacaoService._();

  static AutenticacaoService get instance {
    return _instance;
  }

  UsuarioModel _usuario;
  var _usuarioKey = 'usuario';

  setUsusario(UsuarioModel usuario) {
    this._usuario = usuario;
    _salvarCacheLogin();
  }

  Future<UsuarioModel> getUsuario() async {
    if (_usuario != null) {
      return _usuario;
    } else {
      return await _getCacheLogin();
    }
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

  logout() async {
    var prefs = await SharedPreferences.getInstance();
    this._usuario = null;
    prefs.setString(_usuarioKey, null);
  }
}
