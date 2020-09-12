import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:tcc_egressos/helpers/SharedPreferencesKey.enum.dart';
import 'package:tcc_egressos/model/usuario.model.dart';

class AutenticacaoService {
  AutenticacaoService._() {
    _getPrefsInstance();
  }

  static final AutenticacaoService _instance = AutenticacaoService._();

  static AutenticacaoService get instance {
    return _instance;
  }

  SharedPreferences prefs;
  UsuarioModel _usuario;
  var _usuarioKey = 'usuario';

  setUsusario(UsuarioModel usuario) {
    this._usuario = usuario;
    _salvarCacheLogin();
  }

  UsuarioModel getUsuario() {
    if (_usuario != null) {
      return _usuario;
    } else {
      return _getCacheLogin();
    }
  }

  _getPrefsInstance() async {
    prefs = await SharedPreferences.getInstance();
  }

  UsuarioModel _getCacheLogin() {
    // Erro aqui
    var usuarioString = prefs.getString(_usuarioKey);
    print('--> $_usuarioKey');
    if (usuarioString == null) return null;
    _usuario = UsuarioModel.fromJson(jsonDecode(usuarioString));
    return _usuario;
  }

  _salvarCacheLogin() {
    prefs.setString(_usuarioKey, jsonEncode(_usuario.toJson()));
  }

  logout() {
    this._usuario = null;
    prefs.setString(_usuarioKey, null);
  }
}
