import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'addproduct_screen.dart';
import 'viewproduct_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Flutter Nodejs Exemplo'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            height: 50,
          ),
          ElevatedButton(
            onPressed: () {
              Get.to(() => const AddProductScreen());
            },
            child: const Text("Add Produto"),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {
              Get.to(() => ViewProductScreen());
            },
            child: const Text("Ver seu Produto"),
          )
        ],
      ),
    );
  }
}
