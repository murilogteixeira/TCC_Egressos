import 'package:flutter/material.dart';

class DetalhesCurriculoWidget extends StatelessWidget {
  const DetalhesCurriculoWidget({Key key, this.maxWidth}) : super(key: key);

  final double maxWidth;

  marcador() => Padding(
        padding: const EdgeInsets.only(top: 5),
        child: Container(
          width: 7,
          height: 7,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(3.5)),
            color: Color(0xFFB4AFED),
          ),
        ),
      );

  linha() {
    // if (isLast) {
    //   return Container();
    // }

    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        color: Color(0xFFEBEAF2),
        width: 1,
        height: 32.5,
      ),
    );
  }

  separador() => Container(
        color: Color(0xFFD1D1D1),
        width: maxWidth,
        height: 1,
      );

  detalhes(dados) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            dados['descricao'],
            style: TextStyle(
              fontSize: 13,
              color: Color(0xFF4A4A4A),
            ),
          ),
          Text(
            "${dados['inicio']} - ${dados['atual'] == true ? 'momento' : dados['fim']}",
            style: TextStyle(
              fontSize: 12,
              color: Color(0xFF4A4A4A),
            ),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    var _dados = {
      'titulo': 'Ministério da Educação, MEC, Brasil.',
      'cargos': [
        {
          'descricao':
              'Membro da Comissão ENC, Enquadramento Funcional: Cargo honorífico',
          'inicio': '2001',
          'atual': true,
          'fim': null
        },
        {
          'descricao':
              'Membro da Comissão do ENC-2001, Enquadramento Funcional: Cargo honorífico',
          'inicio': '2000',
          'atual': false,
          'fim': 2001
        },
        {
          'descricao':
              'Membro da C. E. E. Farmácia, Enquadramento Funcional: Cargo honorífico',
          'inicio': '1998',
          'atual': false,
          'fim': 2000
        },
        {
          'descricao':
              'Disponibilidade pela UFPR, Enquadramento Funcional: DAS 2, Carga horária: 40, Regime: Dedicação exclusiva.',
          'inicio': '1975',
          'atual': false,
          'fim': 1983
        },
      ],
    };

    historicoCargo() {
      var cargos = _dados['cargos'] as List<Map<String, Object>>;
      return Column(
        children: cargos.map((cargo) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: <Widget>[
                    marcador(),
                    linha(),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        cargo['descricao'],
                        style: TextStyle(fontSize: 13),
                      ),
                      Text(
                        '${cargo['inicio']} - ${cargo['atual'] == true ? 'momento' : cargo['fim']}',
                        style: TextStyle(fontSize: 12),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        }).toList(),
      );
    }

    return Column(
      children: <Widget>[
        Container(
          constraints: BoxConstraints(maxWidth: maxWidth),
          alignment: Alignment.centerLeft,
          // color: Colors.lightBlueAccent,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 41.5, vertical: 26.5),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 30, bottom: 10),
                        child: Text(
                          _dados['titulo'],
                          style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF547DD9),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      historicoCargo(),
                    ]),
              ),
            ],
          ),
        ),
        separador()
      ],
    );
  }
}
