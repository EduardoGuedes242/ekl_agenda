import 'dart:convert';
import 'package:ekl_agenda/config/global.dart';
import 'package:http/http.dart' as http;

class LoginApi{
  static Future<void> login(String email, senha) async {
    final String url = '${ParametrosGlobais.baseUrlApi}/login';

    Map<String, dynamic> data = {
      'login': email,
      'senha': senha,
    };

    final response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> responseBody = jsonDecode(response.body);
      String token = responseBody['token'];
      ParametrosGlobais.token = token;
    } else {
      print('Erro: ${response.statusCode},  ${response.body}');
    }
  }
}
