// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable
import 'package:ekl_agenda/config/global.dart';
import 'package:ekl_agenda/models/empresa.dart';
import 'package:ekl_agenda/pages/homepage/homepage.dart';
import 'package:flutter/material.dart';

class SelecionarEmpresasWidget extends StatefulWidget {
  List<EmpresaModel> empresas = [];
  SelecionarEmpresasWidget({super.key, required this.empresas});

  @override
  State<SelecionarEmpresasWidget> createState() =>
      _SelecionarEmpresasWidgetState();
}

class _SelecionarEmpresasWidgetState extends State<SelecionarEmpresasWidget> {
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
            Container(
              height: 450,
              child: ListView.builder(
                itemCount: widget.empresas.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: GestureDetector(
                      onTap: () {
                        ParametrosGlobais.nomeEmpresa = widget.empresas[index].empNome!;
                        ParametrosGlobais.codigoEmpresa = widget.empresas[index].empId;
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return HomePage();
                            },
                          ),
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.all(16),
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
                            widget.empresas[index].empNome!,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
