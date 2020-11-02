import 'package:flutter/material.dart';
import 'package:mobile/controller/login.controller.dart';
import 'package:mobile/view/egresso/Perfil/View/dadosGeraisView.dart';
import 'package:mobile/view/egresso/Perfil/View/producoesView.dart';
import 'package:mobile/view/egresso/home/producoes.view.dart';
import 'package:mobile/view/shared/login.view.dart';
import 'package:flutter/src/rendering/box.dart';

class PerfilView extends StatefulWidget {
  @override
  _PerfilViewState createState() => _PerfilViewState();
}

class _PerfilViewState extends State<PerfilView> {
  var nomeEgresso = 'Mário de Oliveira Braga Filho';
  DadosGeraisView dadosGeraisView = DadosGeraisView();
  ProducoesEgressoView producoesEgressoView = ProducoesEgressoView();
  dynamic informacoesEgresso = DadosGeraisView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(left: 0, right: 0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height*0.085,
            ),
            Padding(
                padding: EdgeInsets.only(bottom: 10, top: 40),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(180),
                    child: Image.network(
                      'https://i1.rgstatic.net/ii/profile.image/410743615836161-1474940317115_Q512/Mario_Braga2.jpg',
                      height: 90,
                      width: 90,
                    ))),
            Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Align(
                  alignment: Alignment.center,
                  child: Text(nomeEgresso,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18.0,
                        color: Color(0xFF547DD9),
                      ))),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 40),
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  alignment: Alignment.center,
                  width: 109,
                  height: 20,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Color(0xFF70D169)),
                  child: Text(
                    "Regular",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 10.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 40),
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 20.0),
                height: 50.0,
                color: Colors.white,
                width: (MediaQuery.of(context).size.width),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 130.0,
                      color: Colors.white,
                      child: FlatButton(
                        onPressed: (){
                          setState(() {
                            informacoesEgresso = dadosGeraisView;
                          });
                        }, 
                        child: Text(
                          "Dados Gerais",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 13.0,
                            color: Color(0xFF547DD9),
                          ),
                        )
                      ),
                    ),
                    Container(
                      width: 130.0,
                      color: Colors.white,
                      child: FlatButton(
                        onPressed: (){
                          setState(() {
                            informacoesEgresso = producoesEgressoView;
                          });
                        }, 
                        child: Text(
                          "Produções",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 13.0,
                            color: Color(0xFF547DD9),
                          ),
                        )
                      ),
                    ),
                  ]
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 40),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: informacoesEgresso,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: RaisedButton(
                child: Text('Logout'),
                onPressed: () {
                  LoginController().logout();
                  Navigator.of(context).pushReplacementNamed(LoginView.route);
                },
              ),
            )
          ],
        ),
      ),
    ));
  }
}
