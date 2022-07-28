import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';
import './resultado.dart';

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
  final List<Map<String, Object>> _perguntas = const [
    {
      'texto': 'Qual e a sua cor favorita ?',
      'respostas': ['Preto', 'Vermelho', 'Azul', 'Verde'],
    },
    {
      'texto': 'Qual seu animal favorito ?',
      'respostas': ['Tigre', 'Leao', 'Gato', 'Cachorro'],
    },
    {
      'texto': 'Qual time voce torce ?',
      'respostas': ['Palmeiras', 'Sao Paulo', 'Corinthians', 'Santos'],
    }
  ];

  void _responder() {
    if (temPerguntasSelecionada) {
      setState(() {
        _perguntaSelecionada++;
      });
    }
  }

  bool get temPerguntasSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<String> respostas = temPerguntasSelecionada
        ? _perguntas[_perguntaSelecionada].cast()['respostas']
        : [];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Center(child: Text('PERGUNTAS')),
        ),
        body: temPerguntasSelecionada
            ? Column(
                children: [
                  Questao(_perguntas[_perguntaSelecionada]['texto'].toString()),
                  ...respostas.map((t) => Resposta(t, _responder)).toList(),
                ],
              )
            : const Resultado(),
      ),
    );
  }
}
