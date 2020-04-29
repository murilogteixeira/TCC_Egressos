import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:tcc_egressos/controller/homeController.dart';

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

  @override
  void initState() {
    super.initState();
    _controller = HomeController(context: context);
  }

  @override
  void dispose() {
    super.dispose();
  }

  _consultar() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      _controller.consultar(_id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        var maxWidth = constraints.maxWidth;

        AppBar _appBar;
        if (!kIsWeb) {
          _appBar = AppBar(
            title: Text(widget.title ?? ""),
          );
        }

        if (maxWidth >= 576) {
          return Scaffold(appBar: _appBar, body: _searchBox(SizeScreen.lg));
        }
        return Scaffold(appBar: _appBar, body: _searchBox(SizeScreen.sm));
      }
    );
  }

  _searchBox(SizeScreen sizeScreen) {
    BoxConstraints constraints;
    if (sizeScreen == SizeScreen.lg) {
      constraints = BoxConstraints(maxWidth: 576);
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
                  )
                ],
              ),
            )),
      ),
    );
  }
}
