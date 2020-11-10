import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mobile/globals.dart';
import 'package:mobile/model/curriculo_lattes/egresso.dart';

class Network {
  static Network _instance;

  Network._();

  factory Network() {
    _instance ??= Network._();
    return _instance;
  }

  final headers = {
    'Authorization': 'Token b3240e032bcf3df07185f34322c0f10b65a267e1',
    'Content-Type': 'application/json; charset=UTF-8',
  };

  Future getApi(String url) async {
    final response = await http.get(
      url,
      headers: headers,
    );

    if (response.statusCode == 200) {
      var body = decodeUTF8(response.bodyBytes);
      return jsonDecode(body);
    } else {
      print('Erro na requisição get. URL $url.');
      print('Status code: ${response.statusCode}');
      print('Response body: ${response.body}');
      return null;
    }
  }

  Future postApi(String url, Map body) async {
    final response = await http.post(
      url,
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      var body = decodeUTF8(response.bodyBytes);
      return jsonDecode(body);
    } else {
      print('Erro na requisição post. URL $url.');
      print('Status code: ${response.statusCode}');
      print('Response body: ${response.body}');
      return null;
    }
  }

  Future putApi(String url, Map body) async {
    final response = await http.put(
      url,
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      var body = decodeUTF8(response.bodyBytes);
      return jsonDecode(body);
    } else {
      print('Erro na requisição put. URL $url.');
      print('Status code: ${response.statusCode}');
      print('Response body: ${response.body}');
      return null;
    }
  }
}
