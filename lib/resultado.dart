import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() voltaHome;
  const Resultado(this.pontuacao, this.voltaHome, {Key? key}) : super(key: key);

  String get fraseResultado {
    if (pontuacao <= 8) {
      return 'Nivel Rebaixamento';
    } else if (pontuacao <= 12) {
      return 'OK';
    } else if (pontuacao <= 16) {
      return 'Nivel Guto';
    } else {
      return 'Nivel Abel';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            fraseResultado,
            style: const TextStyle(fontSize: 30.0),
          ),
        ),
        TextButton(
          onPressed: voltaHome,
          child: const Text(
            'Voltar',
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
        )
      ],
    );
  }
}
