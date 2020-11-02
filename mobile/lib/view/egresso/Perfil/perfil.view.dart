import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobile/controller/login.controller.dart';
import 'package:mobile/controller/perfil.controller.dart';
import 'package:mobile/view/egresso/Perfil/View/dadosGeraisView.dart';
import 'package:mobile/view/egresso/Perfil/View/producoesView.dart';
import 'package:mobile/view/egresso/home/producoes.view.dart';
import 'package:mobile/view/shared/login.view.dart';
import 'package:flutter/src/rendering/box.dart';
import 'package:mobx/mobx.dart';

class PerfilView extends StatefulWidget {
  @override
  _PerfilViewState createState() => _PerfilViewState();
}

class _PerfilViewState extends State<PerfilView> {
  var _controller = PerfilController();
  DadosGeraisView dadosGeraisView;
  ProducoesEgressoView producoesEgressoView = ProducoesEgressoView();
  

  @override
  Widget build(BuildContext context) {
    dadosGeraisView = DadosGeraisView(controller: _controller,);
    _controller.setInformacoesEgresso(dadosGeraisView);
    return Scaffold(
        appBar: AppBar(
          title: Text('Perfil'),
        ),
        body: Observer(
          builder: (_) => _controller.egresso == null
              ? Center(
                child: CircularProgressIndicator(),
              )
        : Padding(
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
                        'https://www.pngitem.com/pimgs/m/421-4212617_person-placeholder-image-transparent-hd-png-download.png',
                        height: 90,
                        width: 90,
                      ))),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Align(
                    alignment: Alignment.center,
                    child: Text(_controller.egresso.nome,
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
                            _controller.setInformacoesEgresso(dadosGeraisView);
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
                            _controller.setInformacoesEgresso(producoesEgressoView);
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
              Observer(
                  builder: (_) =>Padding(
                  padding: EdgeInsets.symmetric(vertical: 40),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: _controller.informacoesEgresso
                  ),
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
    ),
    ));
  }
}
