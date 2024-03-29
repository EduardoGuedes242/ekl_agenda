// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

var formatterTime = MaskTextInputFormatter(
  mask: '##:##',
  filter: {"#": RegExp(r'[0-9]')},
  type: MaskAutoCompletionType.lazy,
);


class MyInputField extends StatelessWidget {
  final String titulo;
  final String hint;
  final TextEditingController controllerParametro;
  final bool ocultarCaracteres;
  const MyInputField({
    super.key,
    required this.titulo,
    required this.hint,
    required this.controllerParametro,
    this.ocultarCaracteres = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20, left: 20, right: 20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            bottomLeft: Radius.circular(16),
            bottomRight: Radius.circular(16),
          ),
          boxShadow: [
            BoxShadow(
              blurRadius: 32,
              color: Colors.black.withOpacity(0.2),
              offset: Offset.zero,
            ),
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            titulo,
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          TextField(
            controller: controllerParametro,
            obscureText: ocultarCaracteres,
            decoration: InputDecoration(
              hintText: hint,
              border: InputBorder.none,
            ),
          )
        ],
      ),
    );
  }
}

class MyInputFieldTime extends StatelessWidget {
  final String titulo;
  final String hint;
  final TextEditingController controllerParametro;
  const MyInputFieldTime({
    super.key,
    required this.titulo,
    required this.hint,
    required this.controllerParametro,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20, left: 20, right: 20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            bottomLeft: Radius.circular(16),
            bottomRight: Radius.circular(16),
          ),
          boxShadow: [
            BoxShadow(
              blurRadius: 32,
              color: Colors.black.withOpacity(0.2),
              offset: Offset.zero,
            ),
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            titulo,
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          TextField(
            controller: controllerParametro,
            keyboardType: TextInputType.number,
            inputFormatters: [formatterTime],
            decoration: InputDecoration(
              hintText: hint,
              border: InputBorder.none,
            ),
          )
        ],
      ),
    );
  }
}
