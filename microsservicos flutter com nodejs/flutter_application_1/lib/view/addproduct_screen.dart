import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controller/product_controller.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({Key? key}) : super(key: key);

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final _formKey = GlobalKey<FormState>();
  Map infoProdutos = {"pNome": "", "pValor": "", "pDetalhes": ""};

  ProductController controller = Get.put(ProductController());

  addProduto() {
    _formKey.currentState!.save();
    if (_formKey.currentState!.validate()) {
      controller.createproduto(infoProdutos);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tela adicionar produtos'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(
                  label: Text('Nome do Produto'),
                ),
                onSaved: (value) {
                  infoProdutos['pNome'] = value;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'requer o nome do produto';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  label: Text('Valor do produto'),
                ),
                onSaved: (value) {
                  infoProdutos['pValor'] = value;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Insira o valor do Produto';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  label: Text('Descreva o produto'),
                ),
                onSaved: (value) {
                  infoProdutos['pDetalhes'] = value;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Descreva o produto';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: addProduto, child: const Text("Adicionar"))
              // Add TextFormFields and ElevatedButton here.
            ],
          ),
        ),
      ),
    );
  }
}
