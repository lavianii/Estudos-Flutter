import 'package:despesas_pessoais/models/transacao.dart';
import 'package:flutter/material.dart';

main() {
  runApp(const ExpesesApp());
}

class ExpesesApp extends StatelessWidget {
  const ExpesesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _transacao = [
      Transacao(
        id: "t1",
        title: "Novo tenis",
        value: 310.76,
        date: DateTime.now(),
      ),
      Transacao(
        id: "t2",
        title: "Conta de luz",
        value: 290.12,
        date: DateTime.now(),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Despesesas Pessoais"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const SizedBox(
            child: Card(
              color: Colors.blue,
              elevation: 5,
              child: Text("Gráfico"),
            ),
          ),
          Column(
            children: _transacao.map((tr) {
              return Card(
                child: Row(children: [
                  Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.purple,
                        width: 2,
                      ),
                    ),
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      tr.value.toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.purple),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        tr.title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        tr.date.toString(),
                        style: const TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  )
                ]),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
