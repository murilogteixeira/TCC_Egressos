import 'dart:convert';

import 'curriculo_lattes/egresso.dart';

class Usuario {
  bool status;
  Egresso egresso;
  bool isStaff;

  Usuario({this.status, this.egresso, this.isStaff});

  Usuario.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    egresso =
        json['Egresso'] != null ? Egresso.fromJson(json['Egresso']) : null;
    ;
    isStaff = json['isStaff'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.egresso != null) {
      data['Egresso'] = this.egresso.toJson();
    }
    data['isStaff'] = this.isStaff;
    return data;
  }

  @override
  String toString() {
    return jsonEncode(toJson());
  }
}
