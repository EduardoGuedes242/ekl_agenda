import 'dart:convert';
import 'package:ekl_agenda/config/global.dart';
import 'package:ekl_agenda/models/empresa.dart';
import 'package:http/http.dart' as http;

class EmpresaApi {
  static Future<void> postEmpresa(String nome) async {
    final String url = '${ParametrosGlobais.baseUrlApi}/empresa/add';

    Map<String, dynamic> data = {
      'nome': nome,
    };

    final response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${ParametrosGlobais.token}'
      },
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      print('Resposta: ${response.body}');
    } else {
      print('Erro: ${response.statusCode}');
    }
  }

  static Future<List<EmpresaModel>> getEmpresas() async {
    final String url = '${ParametrosGlobais.baseUrlApi}/empresa';

    final response = await http.get(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${ParametrosGlobais.token}'
      },
    );

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      List<EmpresaModel> empresas =
          jsonResponse.map((json) => EmpresaModel.fromJson(json)).toList();
      return empresas;
    } else {
      print('Erro: ${response.statusCode}');
      throw Exception('Erro ao carregar empresas');
    }
  }
}
