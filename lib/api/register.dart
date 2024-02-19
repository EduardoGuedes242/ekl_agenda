import 'dart:convert';
import 'package:ekl_agenda/config/global.dart';
import 'package:http/http.dart' as http;

class RegisterApi {
  static Future<void> register(String nome, email, senha) async {
    final String url = '${ParametrosGlobais.baseUrlApi}/register';

    Map<String, dynamic> data = {
      'nome': nome,
      'email': email,
      'senha': senha
    };

    final response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );

    // Verifica o status da resposta
    if (response.statusCode == 200) {
      print('Resposta: ${response.body}');
    } else {
      print('Erro: ${response.statusCode}');
    }
  }
}
