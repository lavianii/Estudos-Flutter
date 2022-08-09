import 'package:despesas_pessoais/componentes/transaction_user.dart';
import 'package:flutter/material.dart';

main() => runApp(const ExpensesApp());

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // a pagina inicial do app
      home: MyHomePage(),
      //remover o debug
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //criando a pagina do app
    return Scaffold(
      //parte superior do app
      appBar: AppBar(
        title: const Text('Despesas Pessoais'),
        //criando o botao na appbar
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {},
          ),
        ],
      ),
      //Colocando scrool no app para nao bugar
      body: SingleChildScrollView(
        child: Column(
          //colocando o conteudo na vertical
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [
            //estilizando o texto
            SizedBox(
              child: Card(
                color: Colors.blue,
                elevation: 5,
                child: Text('Gráfico'),
              ),
            ),
            //componente de transacao
            TransactionUser(),
          ],
        ),
      ),
      //botao na parte inferior do app
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}
