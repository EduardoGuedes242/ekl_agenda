// ignore_for_file: prefer_const_constructors
import 'package:ekl_agenda/api/register.dart';
import 'package:ekl_agenda/ui/input_field.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController nomeController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  TextEditingController senha2Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      body: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.all(16),
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back_sharp,
                    size: 42,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ],
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.1,
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
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
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
                      Text('Register', style: TextStyle(fontSize: 48)),
                      SizedBox(height: 40),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          MyInputField(
                            titulo: 'Nome',
                            hint: 'Informe o seu nome',
                            controllerParametro: nomeController,
                          ),
                          SizedBox(height: 40),
                          MyInputField(
                            titulo: 'E-mail',
                            hint: 'exemplo@email.com',
                            controllerParametro: emailController,
                          ),
                          SizedBox(height: 40),
                          MyInputField(
                            titulo: 'Senha',
                            hint: 'Informe a senha',
                            controllerParametro: senhaController,
                            ocultarCaracteres: true,
                          ),
                          SizedBox(height: 40),
                          MyInputField(
                            titulo: 'Repita a senha',
                            hint: 'Informe a senha novamente',
                            controllerParametro: senha2Controller,
                            ocultarCaracteres: true,
                          ),
                          SizedBox(height: 40),
                          GestureDetector(
                            onTap: () async {
                              if (senhaController.text ==
                                  senha2Controller.text) {
                                RegisterApi.register(
                                  nomeController.text,
                                  emailController.text,
                                  senhaController.text,
                                );
                                Navigator.of(context).pop();
                              } else {
                                print('As senhas não estão iguais!');
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
                                  'Criar Conta',
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
                      SizedBox(height: 60),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Ja possui uma conta? ',
                            style: TextStyle(fontSize: 18),
                          ),
                          TextButton(
                            child: Text(
                              'Clique aqui',
                              style: TextStyle(fontSize: 18),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
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
