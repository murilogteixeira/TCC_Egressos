import 'package:flutter/material.dart';
import 'package:mobile/controller/login.controller.dart';
import 'package:mobile/view/shared/login.view.dart';

class PerfilView extends StatefulWidget {
  @override
  _PerfilViewState createState() => _PerfilViewState();
}

class _PerfilViewState extends State<PerfilView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Perfil'),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 50, right: 50),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                    padding: EdgeInsets.only(bottom: 10, top: 40),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(180),
                        child: Image.network(
                          'https://picsum.photos/250?image=9',
                          height: 250,
                          width: 250,
                        ))),
                Padding(
                  padding: EdgeInsets.only(bottom: 40),
                  child: Align(
                      alignment: Alignment.center,
                      child: Text('Vitoria Regia',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 28.0))),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 2),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Nome de Citação:',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18.0))),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text('R. Vitoria',
                          style:
                              TextStyle(color: Colors.black, fontSize: 20.0))),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 2),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Atuação:',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18.0))),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Docencia',
                          style:
                              TextStyle(color: Colors.black, fontSize: 20.0))),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 2),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Cargo Atual:',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18.0))),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Professora Universitaria',
                          style:
                              TextStyle(color: Colors.black, fontSize: 20.0))),
                ),
                Padding(
                    padding: EdgeInsets.only(bottom: 2),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Conatos:',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18.0)))),
                Padding(
                  padding: EdgeInsets.only(bottom: 2),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text('vitoriaregia@mail.com',
                          style:
                              TextStyle(color: Colors.black, fontSize: 20.0))),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 2),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Linkedin@vitoria-regia',
                          style:
                              TextStyle(color: Colors.black, fontSize: 20.0))),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 2),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text('@vitoriaRERE',
                          style:
                              TextStyle(color: Colors.black, fontSize: 20.0))),
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text('(61)9 9999-9999',
                        style: TextStyle(color: Colors.black, fontSize: 20.0))),
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
