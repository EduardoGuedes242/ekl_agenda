// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:ekl_agenda/api/produto.dart';
import 'package:ekl_agenda/config/global.dart';
import 'package:ekl_agenda/ui/input_field.dart';
import 'package:flutter/material.dart';

class CadastrarProdutosPage extends StatefulWidget {
  const CadastrarProdutosPage({super.key});

  @override
  State<CadastrarProdutosPage> createState() => _CadastrarProdutosPageState();
}

class _CadastrarProdutosPageState extends State<CadastrarProdutosPage> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController descricaoController = TextEditingController();
    final TextEditingController precoController = TextEditingController();
    final TextEditingController tempoController = TextEditingController();
    precoController.text = 'R\$';
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de produtos'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            MyInputField(
              titulo: 'Descricao',
              hint: 'Informe o nome do produto',
              controllerParametro: descricaoController,
            ),
            SizedBox(height: 50),
            MyInputField(
              titulo: 'Preço',
              hint: 'Informe o preço do produto',
              controllerParametro: precoController,
            ),
            SizedBox(height: 50),
            MyInputFieldTime(
              titulo: 'Tempo',
              hint: 'Informe o tempo medio',
              controllerParametro: tempoController,
            ),
            Spacer(),
            GestureDetector(
              onTap: () async {
                log(precoController.text);
                ProdutoApi.postProduto(
                  descricaoController.text,
                  ParametrosGlobais.codigoEmpresa.toString(),
                  precoController.text,
                  tempoController.text,
                );
              },
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.deepPurpleAccent,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                ),
                child: Center(
                  child: Text(
                    'Salvar',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30)
          ],
        ),
      ),
    );
  }
}
