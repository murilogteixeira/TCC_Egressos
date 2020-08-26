import 'package:flutter/material.dart';
import 'package:tcc_egressos/model/curriculo_lattes/curriculo_lattes.dart';

class CurriculoListaWidget extends StatelessWidget {
  const CurriculoListaWidget({Key key, this.index, this.curriculo, this.onTapCurriculo})
      : super(key: key);
  final int index;
  final CurriculoLattes curriculo;
  final Function onTapCurriculo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: InkWell(
        child: Container(
          height: 80,
          child: Row(
            children: [
              Text("$index."),
              Container(width: 80, color: Colors.indigo), // FOTO
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[Text(curriculo.nome)],
                ),
              )
            ],
          ),
        ),
        onTap: onTapCurriculo,
      ),
    );
  }
}
