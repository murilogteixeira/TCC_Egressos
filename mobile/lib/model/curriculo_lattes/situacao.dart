import 'package:mobx/mobx.dart';
part 'situacao.g.dart';

class Situacao = _SituacaoBase with _$Situacao;

abstract class _SituacaoBase with Store {
  _SituacaoBase({this.id, this.tipo});

  @observable
  int id;
  @action
  setId(value) => id = value;

  @observable
  String tipo;
  @action
  setTipo(value) => tipo = value;

  fromJson(Map<String, dynamic> json) {
    return Situacao(
      id: json["id"],
      tipo: json["tipo"]
    );
  }

  toJson() {
    return {"id": id, "tipo": tipo};
  }
}
