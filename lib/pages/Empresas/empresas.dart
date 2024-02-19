// ignore_for_file: prefer_const_constructors

import 'package:ekl_agenda/api/empresa.dart';
import 'package:ekl_agenda/models/empresa.dart';
import 'package:ekl_agenda/pages/Empresas/widgets/cadastar_empresa.dart';
import 'package:ekl_agenda/pages/Empresas/widgets/selecionar_empresa.dart';
import 'package:flutter/material.dart';

class EmpresasPage extends StatefulWidget {
  const EmpresasPage({super.key});

  @override
  State<EmpresasPage> createState() => _EmpresasPageState();
}

class _EmpresasPageState extends State<EmpresasPage> {
  List<EmpresaModel> empresas = [];
  bool existeEmpresa = false;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      List<EmpresaModel> empresasRetorno = await EmpresaApi.getEmpresas();
      setState(() {
        empresas = empresasRetorno;
        if (empresas.isEmpty) {
          existeEmpresa = false;
        } else {
          existeEmpresa = true;
        }
      });
    } catch (e) {
      print('Erro ao buscar empresas: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: existeEmpresa
          ? SelecionarEmpresasWidget(empresas: empresas,)
          : CadastarEmpresaWidget(),
    );
  }
}
