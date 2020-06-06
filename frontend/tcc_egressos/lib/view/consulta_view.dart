import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:progress_dialog/progress_dialog.dart';
import 'package:tcc_egressos/components/screenSize.dart';
import 'package:tcc_egressos/controller/home_controller.dart';

class ConsultaView extends StatefulWidget {
  static var route = "/";

  final String title = "Egressos";

  @override
  _ConsultaViewState createState() => _ConsultaViewState();
}

class _ConsultaViewState extends State<ConsultaView> {
  final _formKey = GlobalKey<FormState>();
  String _nome;
  HomeController _controller;
  ProgressDialog pr;

  @override
  void initState() {
    super.initState();
    _controller = HomeController.getInstance(context);
    pr = _createProgressDialog();
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
            appBar: _createAppBar(), body: _searchContainer(ScreenSize.lg));
      }
      return Scaffold(
          appBar: _createAppBar(), body: _searchContainer(ScreenSize.sm));
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

    return Center(
      child: Container(
        constraints: constraints,
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: "Digite o nome para consulta ",
                        labelText: "Nome",
                        icon: Icon(Icons.assignment_ind)),
                    validator: (id) => id.isEmpty ? "Digite o nome" : null,
                    onSaved: (value) => _nome = value,
                    textInputAction: TextInputAction.go,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 14),
                    child: MaterialButton(
                      color: Colors.green,
                      onPressed: _consultar,
                      child: Text(
                        "Buscar nome",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 14),
                    child: MaterialButton(
                      color: Colors.blue,
                      onPressed: _buscarTodos,
                      child: Text(
                        "Buscar todos",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
