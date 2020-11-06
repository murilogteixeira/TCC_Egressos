import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobile/components/egresso_list_row.dart';
import 'package:mobile/controller/admin/egressos_list.controller.dart';
import 'package:mobile/main.dart';
import 'package:mobile/model/curriculo_lattes/egresso.dart';
import 'package:mobile/view/egresso/Perfil/perfil.view.dart';

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
                  return Center(child: Text('Não encontrado...'));

                return Container(
                  color: Colors.white,
                  child: ListView.builder(
                    itemCount: controller.egressosFiltered.length,
                    itemBuilder: (BuildContext context, int index) {
                      final egresso = controller.egressosFiltered[index];
                      return EgressoListRow(
                        imagemURL: "",
                        corBordaImagem: Colors.red,
                        nome: egresso.nome,
                        cargo:
                            'Professor no departamento de engenharia da Universidade Católica de Brasília',
                        grau: 'Doutor',
                        isFirst: index == 0,
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(PerfilView.route, arguments: egresso);
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
