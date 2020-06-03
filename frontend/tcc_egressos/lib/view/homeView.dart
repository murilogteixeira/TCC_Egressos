import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:progress_dialog/progress_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tcc_egressos/controller/homeController.dart';
import 'package:tcc_egressos/model/curriculoLattes.dart';

enum SizeScreen { lg, md, sm }

class HomeView extends StatefulWidget {
  final String title;
  HomeView({this.title});
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _formKey = GlobalKey<FormState>();
  String _id;
  HomeController _controller;
  ProgressDialog pr;

  @override
  void initState() {
    super.initState();
    _controller = HomeController(context: context);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    pr = ProgressDialog(context);
    pr.style(
      message: "Buscando LattesID",
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

    _consultar() {
      pr.show();
      if (_formKey.currentState.validate()) {
        _formKey.currentState.save();
        Future<CurriculoLattes> curriculoLattes = _controller.consultar(_id);
        if (curriculoLattes != null) {
          curriculoLattes.then((curriculo) async {
            final prefs = await SharedPreferences.getInstance();
            prefs.setString("curriculoLattes", json.encode(curriculo.toJson()));
            pr.hide().whenComplete(
                () => Navigator.of(context).pushNamed("/resultado"));
          });
        }
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
                        hintText: "Digite o ID do Currículo Lattes ",
                        labelText: "ID Lattes",
                        icon: Icon(Icons.assignment_ind)),
                    validator: (id) {
                      if (id.isEmpty) {
                        return "Digite o ID";
                      }
                      return null;
                    },
                    onSaved: (id) {
                      this._id = id;
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
