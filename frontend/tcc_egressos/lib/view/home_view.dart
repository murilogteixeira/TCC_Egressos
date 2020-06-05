import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:progress_dialog/progress_dialog.dart';
import 'package:tcc_egressos/components/ScreenSize.dart';
import 'package:tcc_egressos/controller/home_controller.dart';

class HomeView extends StatefulWidget {
  static var route = "/";

  final String title;
  HomeView({this.title});
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _formKey = GlobalKey<FormState>();
  String _nome;
  HomeController _controller;
  ProgressDialog pr;

  @override
  void initState() {
    super.initState();
    _controller = HomeController();
  }

  @override
  void dispose() {
    _controller = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    pr = ProgressDialog(context);
    pr.style(
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

    return LayoutBuilder(builder: (context, constraints) {
      var maxWidth = constraints.maxWidth;

      if (maxWidth >= 576) {
        return Scaffold(
            appBar: _createAppBar(), body: _searchBox(SizeScreen.lg));
      }
      return Scaffold(appBar: _createAppBar(), body: _searchBox(SizeScreen.sm));
    });
  }

  _createAppBar() {
    return kIsWeb
        ? null
        : AppBar(
            title: Text(widget.title ?? ""),
          );
  }

  _searchBox(SizeScreen sizeScreen) {
    BoxConstraints constraints;
    if (sizeScreen == SizeScreen.lg) {
      constraints = BoxConstraints(maxWidth: 576);
    }

    _consultar() async {
      if (_formKey.currentState.validate()) {
        _formKey.currentState.save();

        pr.show();

        var requestOK = await _controller.consultar(_nome);

        pr.hide().whenComplete(() {
          if (requestOK) {
            Navigator.pushNamed(context, "/resultado",
                arguments: _controller.lista);
          }
        });
      }
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
                    validator: (id) {
                      if (id.isEmpty) {
                        return "Digite o nome";
                      }
                      return null;
                    },
                    onSaved: (nome) {
                      this._nome = nome;
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 14),
                    child: MaterialButton(
                      color: Colors.green,
                      onPressed: () {
                        _consultar();
                      },
                      child: Text(
                        "Consultar",
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
