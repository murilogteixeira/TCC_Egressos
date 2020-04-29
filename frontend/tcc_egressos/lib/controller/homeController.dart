import 'package:flutter/material.dart';

class HomeController {
  final BuildContext context;
  HomeController({this.context});
  
  consultar(String id) {
    print(id);
    Navigator.of(context).pushNamed("/resultado");
  }
}