import 'dart:math';

import 'package:flutter/material.dart';
import 'transaction_form.dart';
import 'transaction_list.dart';
import '../models/transaction.dart';

class TransactionUser extends StatefulWidget {
  const TransactionUser({Key? key}) : super(key: key);

  @override
  State<TransactionUser> createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {
  //apenas para teste
  final _transactions = [
    Transaction(
      id: 't1',
      title: 'Conta #1',
      value: 310.76,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Conta #2',
      value: 211.30,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't3',
      title: 'Conta #3',
      value: 211.30,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't5',
      title: 'Conta #4',
      value: 211.30,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't5',
      title: 'Conta #5',
      value: 211.30,
      date: DateTime.now(),
    ),
  ];
  //para adicionar novas transacoes
  _addTransaction(String title, double value) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: DateTime.now(),
    );

    setState(() {
      _transactions.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //componentes
        TransactionForm(_addTransaction),
        TransactionList(_transactions),
      ],
    );
  }
}
