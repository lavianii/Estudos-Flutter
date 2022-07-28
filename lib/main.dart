import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

void main() {
  runApp(const PerguntaApp());
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({Key? key}) : super(key: key);

  @override
  State<PerguntaApp> createState() => _PerguntaAppState();
}

class _PerguntaAppState extends State<PerguntaApp> {
  int _perguntaSelecionada = 0;

  void _responder() {
    setState(() {
      _perguntaSelecionada++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<String> perguntas = [
      "Qual é a sua cor favorita ?",
      "Qual é o seu animal preferido ?"
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.greenAccent,
          title: const Center(child: Text('PERGUNTAS')),
        ),
        body: Column(children: [
          Questao(perguntas[_perguntaSelecionada]),
          Resposta("Botão 1", _responder),
          Resposta("Botão 2", _responder),
          Resposta("Botão 3", _responder)
        ]),
      ),
    );
  }
}
