// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ekl_agenda/api/empresa.dart';
import 'package:ekl_agenda/pages/Empresas/empresas.dart';
import 'package:ekl_agenda/ui/input_field.dart';
import 'package:flutter/material.dart';

class CadastarEmpresaWidget extends StatefulWidget {
  const CadastarEmpresaWidget({super.key});

  @override
  State<CadastarEmpresaWidget> createState() => _CadastarEmpresaWidgetState();
}

class _CadastarEmpresaWidgetState extends State<CadastarEmpresaWidget> {
  TextEditingController nomeEmpresaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Seja Bem Vindo(a)!',
              style: TextStyle(fontSize: 24),
            ),
            MyInputField(
              titulo: 'Local Estabelecimento',
              hint: 'Studio Vitória/ES',
              controllerParametro: nomeEmpresaController,
            ),
            GestureDetector(
              onTap: () async {
                EmpresaApi.postEmpresa(nomeEmpresaController.text);
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return EmpresasPage();
                    },
                  ),
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
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
