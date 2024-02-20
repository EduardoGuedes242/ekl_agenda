// ignore_for_file: prefer_const_constructors

import 'package:ekl_agenda/config/global.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.white,
        child: Center(
          child: Text(
            'Empresa: ' + ParametrosGlobais.nomeEmpresa,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        onPressed: () {},
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
