import 'package:tcc_egressos/helpers/funcao.enum.dart';
import 'package:tcc_egressos/model/curriculo_lattes/curriculo_lattes.dart';

class UsuarioModel {
  String id;
  String nome;
  String email;
  String senha;
  CurriculoLattes curriculo;
  Funcao funcao;

  UsuarioModel({
    this.id,
    this.nome,
    this.email,
    this.senha,
    this.curriculo,
    this.funcao,
  });

  UsuarioModel.fromJson(Map<String, dynamic> json) {
    if (json.containsKey('id')) id = json['id'];
    nome = json['nome'];
    email = json['email'];
    if (json.containsKey('senha')) senha = json['senha'];
    // curriculo = CurriculoLattes().fromJson(jsonDecode(json['curriculo']));
    funcao = Funcao.values
        .firstWhere((e) => e.toString() == 'Funcao.' + json['funcao']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['email'] = this.email;
    data['senha'] = this.senha;
    // data['curriculo'] = jsonEncode(this.curriculo.toJson());
    data['funcao'] = this
        .funcao
        .toString()
        .substring(this.funcao.toString().indexOf('.') + 1);
    return data;
  }
}
