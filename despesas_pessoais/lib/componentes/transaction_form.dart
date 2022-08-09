import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  final titleController = TextEditingController();
  final valueController = TextEditingController();

  final void Function(String, double) onSubmit;

  //fecha o teclado quando o usuario clicar em salvar
  _submitForm() {
    final title = titleController.text;
    //converte o valor para double
    final value = double.tryParse(valueController.text) ?? 0.0;
    if (title.isEmpty || value <= 0) {
      return;
    }
    onSubmit(title, value);
  }

  //construtor
  TransactionForm(this.onSubmit, {Key? key}) : super(key: key);

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
