import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:progress_dialog/progress_dialog.dart';
import 'package:tcc_egressos/components/nav_bar_widget.dart';
import 'package:tcc_egressos/components/screenSize.dart';
import 'package:tcc_egressos/controller/home_controller.dart';
import 'package:mobx/mobx.dart';
import 'package:tcc_egressos/model/curriculo_lattes/egresso.dart';
import 'package:tcc_egressos/view/list_egressos.dart';
import 'package:tcc_egressos/model/curriculo_lattes/curriculo_lattes.dart';

class ConsultaView extends StatefulWidget {
  static var route = "/consulta";

  final String title = "Egressos";

  @override
  _ConsultaViewState createState() => _ConsultaViewState();
}

class _ConsultaViewState extends State<ConsultaView> {
  final _formKey = GlobalKey<FormState>();
  String _nome;
  HomeController _controller;
  ProgressDialog pr;
  Future<ObservableList<CurriculoLattes>> curriculos;

  Future<ObservableList<Egresso>> egressos;

  int numeroBuscados;

  @override
  void initState() {
    super.initState();
    _controller = HomeController(context);
    pr = _createProgressDialog();
    // curriculos = _controller.getCurriculos();
    egressos = _controller.getEgressos();
  }

  @override
  void dispose() {
    _controller = null;
    super.dispose();
  }

  _createProgressDialog() {
    var progressDialog = ProgressDialog(context);
    progressDialog.style(
      message: "Buscando dados",
      borderRadius: 10,
      backgroundColor: Colors.white,
      progressWidget: CircularProgressIndicator(),
      elevation: 10,
      insetAnimCurve: Curves.easeInOut,
      progress: 0,
      maxProgress: 100,
      progressTextStyle: TextStyle(
          color: Colors.black, fontSize: 13, fontWeight: FontWeight.w400),
      messageTextStyle: TextStyle(
          color: Colors.black, fontSize: 19, fontWeight: FontWeight.w600),
    );
    return progressDialog;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      var maxWidth = constraints.maxWidth;

      if (maxWidth >= 576) {
        return Scaffold(
          appBar: _createAppBar(),
          body: _searchContainer(ScreenSize.lg),
          backgroundColor: Color(0xFFEAEDF2),
        );
      }
      return Scaffold(
        appBar: _createAppBar(),
        body: _searchContainer(ScreenSize.sm),
        backgroundColor: Color(0xFFEAEDF2),
      );
    });
  }

  _createAppBar() {
    return kIsWeb
        ? null
        : AppBar(
            title: Text(widget.title ?? ""),
          );
  }

  _searchContainer(ScreenSize sizeScreen) {
    BoxConstraints constraints;
    if (sizeScreen == ScreenSize.lg) {
      constraints = BoxConstraints(maxWidth: 576);
    }

    _consultar() {
      if (_formKey.currentState.validate()) {
        _formKey.currentState.save();
        pr.show();
        _controller.consultar(_nome, () => pr.hide());
      }
    }

    _buscarTodos() {
      pr.show();
      _controller.buscarTodos(() => pr.hide());
    }

    return SingleChildScrollView(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            NavBarWidget(),
            Center(
              child: Container(
                constraints: constraints,
                child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 58),
                    child: Form(
                      key: _formKey,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(right: 14),
                            child: Container(
                              width: 400,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(45),
                              ),
                              child: Center(
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    hintText: "Pesquise pelo egresso",
                                    enabledBorder: new UnderlineInputBorder(
                                        borderRadius: BorderRadius.circular(45),
                                        borderSide: BorderSide(
                                            color: Colors.transparent)),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.transparent),
                                      borderRadius: BorderRadius.circular(45),
                                    ),
                                    icon: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          20, 0, 0, 0),
                                      child: Icon(Icons.search),
                                    ),
                                  ),
                                  onSaved: (nome) {
                                    this._nome = nome;
                                  },
                                ),
                              ),
                            ),
                          ),
                          MaterialButton(
                            color: Color(0xFF547DD9),
                            height: 50,
                            minWidth: 140,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(45)),
                            onPressed: () {
                              _consultar();
                            },
                            child: Text(
                              "Pesquisar",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          // Padding(
                          //   padding: const EdgeInsets.only(top: 14),
                          //   child: MaterialButton(
                          //     color: Colors.blue,
                          //     onPressed: () {
                          //       _buscarTodos();
                          //     },
                          //     child: Text(
                          //       "Buscar todos",
                          //       style: TextStyle(color: Colors.white),
                          //     ),
                          //   ),
                          // )
                        ],
                      ),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 45),
              child: Container(
                  width: 750,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  child: Align(
                      alignment: Alignment.bottomCenter,
                      child: FutureBuilder(
                        // future: curriculos,
                        future: egressos,
                        /*builder: (context,
                            AsyncSnapshot<ObservableList<CurriculoLattes>>
                                snapshot)*/
                        builder: (context,
                            AsyncSnapshot<ObservableList<Egresso>> snapshot) {
                          if (snapshot.hasData) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: EdgeInsets.fromLTRB(20, 20, 0, 20),
                                    child: Text(
                                      "Egressos mais pesquisados",
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 85, 125, 217),
                                          fontSize: 20),
                                    ),
                                  ),
                                  /*ListEgressos(
                                    list: snapshot.data,
                                    sizeList: snapshot.data.length == 0
                                        ? 3
                                        : snapshot.data.length,
                                  ),*/
                                  ListEgressos(
                                    egressos: snapshot.data,
                                    sizeList: snapshot.data.length == 0
                                        ? 3
                                        : snapshot.data.length,
                                  ),
                                ],
                              ),
                            );
                          } else if (snapshot.hasError) {
                            return Text("Deu ruim meu amigo!");
                          }
                          return Text("Carregando...");
                        },
                      ))),
            )
          ],
        ),
      ),
    );
  }
}
