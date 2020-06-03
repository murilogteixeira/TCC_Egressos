import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tcc_egressos/model/curriculoLattes.dart';
import 'package:http/http.dart' as http;

class HomeController {
  final BuildContext context;
  HomeController({this.context});
  
  Future<CurriculoLattes> consultar(String lattesID) async {
    return _fetchCurriculoLattes(lattesID);
  }

  Future<CurriculoLattes> _fetchCurriculoLattes(String lattesID) async {
    var url = 'https://tccegresostest.herokuapp.com/api/$lattesID';
    final response = await http.get(url);

    if(response.statusCode == 200) {
      return CurriculoLattes.fromJson(json.decode(response.body));
    }
    else {
      throw Exception('Falha ao carregar o Curriculo Lattes. ID: $lattesID');
    }
  }

}
