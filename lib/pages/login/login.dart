// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ekl_agenda/api/login.dart';
import 'package:ekl_agenda/config/global.dart';
import 'package:ekl_agenda/pages/cadastro/cadastro.dart';
import 'package:ekl_agenda/pages/Empresas/empresas.dart';
import 'package:ekl_agenda/ui/input_field.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.3,
            decoration: BoxDecoration(
              color: Colors.deepPurpleAccent,
              // image: DecorationImage(
              //   image: AssetImage("assets/images/backgronund-login.png"),
              //   fit: BoxFit.cover,
              // ),
            ),
            // child: Center(
            //   child: Image(
            //     image: AssetImage("assets/images/logo.png"),
            //     width: 100,
            //   ),
            // ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(64)),
              ),
              child: SafeArea(
                top: false,
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Login', style: TextStyle(fontSize: 48)),
                      SizedBox(height: 40),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          MyInputField(
                            titulo: 'Email',
                            hint: 'informe seu email',
                            controllerParametro: emailController,
                          ),
                          SizedBox(height: 40),
                          MyInputField(
                            titulo: 'Senha',
                            hint: 'Senha',
                            controllerParametro: senhaController,
                            ocultarCaracteres: true,
                          ),
                          SizedBox(height: 40),
                          GestureDetector(
                            onTap: () async {
                              await LoginApi.login(emailController.text, senhaController.text);
                              if (ParametrosGlobais.token != '') {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return EmpresasPage();
                                    },
                                  ),
                                );
                              }
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
                                  'Acessar',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 60),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Não tem uma conta? ',
                            style: TextStyle(fontSize: 18),
                          ),
                          TextButton(
                            child: Text(
                              'Crie uma',
                              style: TextStyle(fontSize: 18),
                            ),
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) {
                                    return RegisterPage();
                                  },
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
