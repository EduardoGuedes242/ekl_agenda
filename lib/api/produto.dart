import 'dart:convert';

import 'package:ekl_agenda/config/global.dart';
import 'package:ekl_agenda/models/produto.dart';
import 'package:http/http.dart' as http;

class ProdutoApi {
  static Future<void> postProduto(
      String descricao, empresa, preco, tempo) async {
    final String url = '${ParametrosGlobais.baseUrlApi}/produtos/add';

    Map<String, dynamic> data = {
      'descricao': descricao,
      'empresa': empresa,
      'preco': preco,
      'tempo': tempo
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

  static Future<List<ProdutoModel>> getProdutos(String empresa) async {
    final String url = '${ParametrosGlobais.baseUrlApi}/produto/$empresa';

    final response = await http.get(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${ParametrosGlobais.token}'
      },
    );

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      List<ProdutoModel> produtos =
          jsonResponse.map((json) => ProdutoModel.fromJson(json)).toList();
      return produtos;
    } else {
      print('Erro: ${response.statusCode}');
      throw Exception('Erro ao carregar produtos');
    }
  }
}
