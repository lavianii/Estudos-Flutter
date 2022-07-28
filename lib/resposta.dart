import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String texto;
  final void Function() quandoSelecionado;

  const Resposta(this.texto, this.quandoSelecionado, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: const Color.fromARGB(255, 0, 0, 0),
          onPrimary: Colors.white,
        ),
        onPressed: quandoSelecionado,
        child: Text(texto),
      ),
    );

    //Minha maneira que foi resolvida
    // return SizedBox(
    //   width: 300,
    //   child: Text(
    //     texto,
    //     style: const TextStyle(fontSize: 15),
    //     textAlign: TextAlign.center,
    //   ),
    // );
  }
}
