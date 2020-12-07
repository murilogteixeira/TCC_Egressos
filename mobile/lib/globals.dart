import 'dart:convert';

import 'package:flutter/material.dart';

var mainColor = Color(0xFF30559F);

String decodeUTF8(string) {
  return utf8.decode(string);
}

final inputDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(7)),
    borderSide: BorderSide(color: Color(0xFF547DD9), width: 2.0),
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(7)),
    borderSide: BorderSide(color: Color(0xFFDCDDE0), width: 2.0),
  ),
  errorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(7)),
    borderSide: BorderSide(color: Colors.red, width: 2.0),
  ),
);

searchInputDecoration(String placeholder) {
  return InputDecoration(
    hintText: placeholder,
    filled: true,
    fillColor: Colors.white,
    contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(25)),
      borderSide: BorderSide(color: Color(0xFF547DD9), width: 1),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(25)),
      borderSide: BorderSide(color: Color(0xFFDCDDE0), width: 0),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(25)),
      borderSide: BorderSide(color: Colors.transparent, width: 0),
    ),
  );
}
