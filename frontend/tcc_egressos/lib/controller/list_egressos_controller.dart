import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tcc_egressos/components/network.dart';
import 'package:diacritic/diacritic.dart';
import 'package:tcc_egressos/model/curriculo_lattes/egresso.dart';
import 'package:tcc_egressos/view/curriculo_view.dart';
import 'package:tcc_egressos/view/resultado_view.dart';

class ListEgressosController {
  static ListEgressosController _instance;
  static getInstance(BuildContext context) {
    if (_instance == null) {
      return ListEgressosController(context);
    }
    return _instance;
  }

  ListEgressosController(this.context);
  final context;

  ObservableList<Egresso> egressos = ObservableList<Egresso>();
  ObservableList<Egresso> egressosFiltered = ObservableList<Egresso>();
  // ObservableList<CurriculoLattes> curriculos = ObservableList();

  consultar(String nome, doneCallback) async {
    final url = 'https://egressosbackend.herokuapp.com/egressos/';

    List json = await Network().fetchData(url);
    if (json == null) return null;

    json.forEach((element) {
      var egresso = Egresso.fromJson(element);
      egressos.add(egresso);
    });

    nome = nome.toUpperCase();
    nome = removeDiacritics(nome);
    if (nome.isEmpty) {
      egressos.forEach((e) {
        egressosFiltered.add(e);
      });
    } else {
      egressosFiltered.removeWhere((element) => true);
      print("\n\n\n\n\n lenght: " + egressosFiltered.length.toString());
      print("lista: " + egressosFiltered.toString() + "\n\n\n\n\n");
      egressos.forEach((e) {
        var value = e.nome.toUpperCase();
        value = removeDiacritics(value);
        if (value.contains(nome)) egressosFiltered.add(e);
      });
    }

    if (egressos.isNotEmpty) {
      doneCallback();
      Navigator.pushNamed(context, ResultadoView.route,
          arguments: egressosFiltered);
    }
    doneCallback();
  }

  onTapEgresso(Egresso egresso) {
    _setEgresso(egresso);
    Navigator.pushNamed(context, CurriculoView.route, arguments: egresso);
  }

  _setEgresso(Egresso egresso) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setString("egresso", jsonEncode(egresso.toJson()));
  }

  addEgresso(Egresso egresso) {
    egressos.add(egresso);
  }

  // salvarListaSP() async {
  //   var prefs = await SharedPreferences.getInstance();
  //   prefs.setStringList(
  //       "lista", egressos.map((e) => jsonEncode(e.toJson())).toList());
  // }

  // obterListaSP() async {
  //   var prefs = await SharedPreferences.getInstance();
  //   var listaString = prefs.getStringList("lista");
  //   var lista = ObservableList<Egresso>();
  //   if (listaString != null) {
  //     listaString
  //         .map((e) => lista.add(Egresso.fromJson(jsonDecode(e))))
  //         .toList();
  //   }
  //   this.egressos = lista;
  // }

  Future<ObservableList<Egresso>> getEgressos() async {
    final url = 'https://egressosbackend.herokuapp.com/egressos';

    List json = await Network().fetchData(url);
    if (json == null) {
      print('Erro ao buscar os egressos');
      return null;
    }

    json.forEach((element) {
      egressos.add(Egresso.fromJson(element));
    });

    if (egressos.isNotEmpty) {
      return Future.value(egressos);
    }

    return null;
  }

  String _decodeUTF8(string) {
    return utf8.decode(string);
  }
}
