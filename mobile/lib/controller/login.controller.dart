import 'package:mobile/helpers/enum/funcao.dart';
import 'package:mobile/model/curriculo_lattes/curriculo_lattes.dart';
import 'package:mobile/model/usuario.model.dart';
import 'package:mobile/service/autenticacao.service.dart';

class LoginViewController {
  final _email = 'mail@mail.com';
  final _senha = '123';

  UsuarioModel usuario;

  UsuarioModel efetuarLogin(String email, String senha) {
    UsuarioModel usuario;
    if (_email == email && _senha == senha) {
      usuario = UsuarioModel(
          email: email,
          nome: "",
          curriculo: CurriculoLattes(),
          funcao: Funcao.egresso);
      _salvarUsuario(usuario);
    }
    return usuario;
  }

  _salvarUsuario(UsuarioModel usuario) async {
    AutenticacaoService.instance.setUsusario(usuario);
  }
}
