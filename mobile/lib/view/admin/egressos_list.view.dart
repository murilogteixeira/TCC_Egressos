import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobile/components/egresso_list_row.dart';
import 'package:mobile/controller/admin/egressos_list.controller.dart';
import 'package:mobile/controller/shared/login.controller.dart';
import 'package:mobile/model/curriculo_lattes/egresso.dart';
import 'package:mobile/view/egresso/Perfil/perfil.view.dart';

import '../../globals.dart';

class EgressosListView extends StatefulWidget {
  static final route = '/consulta';
  @override
  _EgressosListViewState createState() => _EgressosListViewState();
}

class _EgressosListViewState extends State<EgressosListView> {
  final controller = EgressosListController();

  final topColor = Color(0xFFEAEDF2);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEAEDF2),
      appBar: AppBar(
        title: Text('Egressos'),
        backgroundColor: mainColor,
        actions: [
          FlatButton(
            child: Text(
              'Sair',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () {
              LoginController().logout(context);
            },
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
              child: Container(
                height: 40,
                child: TextField(
                  textAlign: TextAlign.center,
                  decoration: searchInputDecoration('Digite para buscar...'),
                  onChanged: controller.filter,
                ),
              ),
            ),
            Expanded(
              child: Observer(builder: (_) {
                if (controller.egressos.isEmpty)
                  return Center(child: CircularProgressIndicator());

                if (controller.egressosFiltered.isEmpty)
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Egresso não encontrado...',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 120),
                      ],
                    ),
                  );

                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                  ),
                  child: ListView.builder(
                    itemCount: controller.egressosFiltered.length,
                    itemBuilder: (BuildContext context, int index) {
                      var egresso = controller.egressosFiltered[index];

                      Color corSituacao;
                      switch (egresso.situacao.id) {
                        case 1: // regular
                          corSituacao = Colors.blue;
                          break;
                        case 2: // adiantado
                          corSituacao = Colors.green;
                          break;
                        case 3: // atrasado
                          corSituacao = Colors.red;
                          break;
                        default:
                      }

                      return EgressoListRow(
                        imagemURL: "",
                        corBordaImagem: corSituacao,
                        nome: egresso.nome,
                        cargo:
                            'Professor no departamento de engenharia da Universidade Católica de Brasília',
                        grau: 'Doutor',
                        isFirst: index == 0,
                        onPressed: () async {
                          await Navigator.of(context)
                              .pushNamed(PerfilView.route, arguments: egresso);
                          // controller.fetchEgressos();
                        },
                      );
                    },
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
