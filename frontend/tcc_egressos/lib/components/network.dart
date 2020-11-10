import 'dart:convert';

import 'package:http/http.dart' as http;

class Network {
  static Network _instance;

  Network._();

  factory Network() {
    _instance ??= Network._();
    return _instance;
  }

  Future fetchData(String url) async {
    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Token b3240e032bcf3df07185f34322c0f10b65a267e1',
      },
    );

    if (response.statusCode == 200) {
      var body = decodeUTF8(response.bodyBytes);
      return jsonDecode(body);
    } else {
      print('Erro ao buscar dados na url $url.');
      print('Status code: ${response.statusCode}');
      print('Response body: ${response.body}');
      return null;
    }
  }
}

String decodeUTF8(string) {
  return utf8.decode(string);
}
