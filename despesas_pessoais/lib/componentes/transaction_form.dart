import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double) onSubmit;

  const TransactionForm(this.onSubmit, {Key? key}) : super(key: key);

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  
  final titleController = TextEditingController();
  final valueController = TextEditingController();

  //fecha o teclado quando o usuario clicar em salvar
  _submitForm() {
    final title = titleController.text;
    //converte o valor para double
    final value = double.tryParse(valueController.text) ?? 0.0;
    if (title.isEmpty || value <= 0) {
      return;
    }
    //estou chamando o parametro para ter acesso a onSubmit
    widget.onSubmit(title, value);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            //label para colocar o nome da transacao
            TextField(
              controller: titleController,
              onSubmitted: (_) => _submitForm,
              decoration: const InputDecoration(
                labelText: 'Título',
              ),
            ),
            //label para colocar o valor da transacao
            TextField(
              controller: valueController,
              //tipo de teclado que ira abrir
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => _submitForm,
              decoration: const InputDecoration(
                labelText: 'Valor (R\$)',
              ),
            ),
            //colocando o botao no lado direito do app
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  onPressed: _submitForm,
                  child: const Text(
                    'Nova Transação',
                    style: TextStyle(
                      color: Colors.purple,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
