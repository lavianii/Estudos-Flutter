import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

main() => runApp(PerguntaApp());

class PerguntaApp extends StatelessWidget {
  int perguntaSelecionada = 0;

  void responder() {
    perguntaSelecionada++;
    print(perguntaSelecionada);
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
          title: const Center(child: Text("PERGUNTAS")),
        ),
        body: Column(
          children: [
            Text(perguntas[perguntaSelecionada]),
            ElevatedButton(
                onPressed: responder, child: const Text("Resposta 1")),
            ElevatedButton(
                onPressed: () {
                  log("Resposta com funcao anonima");
                },
                child: const Text("Resposta 2")),
            ElevatedButton(
                onPressed: () => {log("Resposta com arrow function")},
                child: const Text("Resposta 3"))
          ],
        ),
      ),
    );
  }
}
