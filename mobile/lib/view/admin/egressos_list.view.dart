import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobile/components/egresso_list_row.dart';
import 'package:mobile/controller/admin/egressos_list.controller.dart';
import 'package:mobile/model/curriculo_lattes/egresso.dart';
import 'package:mobile/model/curriculo_lattes/endereco.dart';
import 'package:mobile/view/egresso/Perfil/editar_perfil.view.dart';
import 'package:mobile/view/egresso/Perfil/perfil.view.dart';

class EgressosListView extends StatefulWidget {
  static final route = '/consulta';
  @override
  _EgressosListViewState createState() => _EgressosListViewState();
}

class _EgressosListViewState extends State<EgressosListView> {
  var controller = EgressosListController();

  List<Egresso> usuarios = [];

  _criarLista() {
    usuarios = [];
    int i;
    for (i = 0; i < 10; i++) {
      var usuario = Egresso(
        nome: 'Mário Braga',
        celular: '99 99999 9999',
        dNasc: '',
        email: 'mail@mail.com',
        id: 1,
        idLattes: '2345234523452345',
        nomeCitacoes: 'Braga, M.',
        producoes: [],
      );
      usuarios.add(usuario);
    }
  }

  @override
  Widget build(BuildContext context) {
    _criarLista();

    var controller = EgressosListController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Egressos'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Observer(
              builder: (_) => controller.egressos.length == 0
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.builder(
                      itemCount: controller.egressos.length,
                      itemBuilder: (BuildContext context, int index) {
                        return EgressoListRow(
                          imagemURL: "",
                          corBordaImagem: Colors.red,
                          nome: controller.egressos[index].nome,
                          cargo:
                              'Professor no departamento de engenharia da Universidade Católica de Brasília',
                          grau: 'Doutor',
                          isFirst: index == 0,
                          onPressed: () {
                            Navigator.of(context).pushNamed(PerfilView.route,
                                arguments: controller.egressos[index]);
                          },
                        );
                      },
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
