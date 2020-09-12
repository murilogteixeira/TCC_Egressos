import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:tcc_egressos/helpers/funcao.enum.dart';
import 'package:tcc_egressos/model/curriculo_lattes/curriculo_lattes.dart';
import 'package:tcc_egressos/model/usuario.model.dart';

class LoginViewController {
  final _email = 'mail@mail.com';
  final _senha = '123';

  UsuarioModel usuario;

  bool efetuarLogin(String email, String senha) {
    if (_email == email && _senha == senha) {
      _salvarUsuario(UsuarioModel(email: email, nome: "", curriculo: CurriculoLattes(), funcao: Funcao.admin));
      return true;
    } else {
      return false;
    }
  }

  _salvarUsuario(UsuarioModel usuario) async {
    var pref = await SharedPreferences.getInstance();
    pref.setString('usuario', jsonEncode(usuario.toJson()));
  }
}
