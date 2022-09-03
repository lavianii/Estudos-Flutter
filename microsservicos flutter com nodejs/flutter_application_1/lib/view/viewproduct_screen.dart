import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controller/product_controller.dart';

class ViewProductScreen extends StatelessWidget {
  ViewProductScreen({Key? key}) : super(key: key);

  final ProductController controller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    controller.getProduct();
    return Scaffold(
      body: GetBuilder<ProductController>(
        builder: (controller) => controller.allProduct.isEmpty
            ? const Center(
                child: Text('Não mandou a informacao do produto'),
              )
            : ListView.builder(
                itemCount: controller.allProduct.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          const Text("Cerca de produtos"),
                          const SizedBox(
                            height: 0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Text(
                                "Nome do produto :",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                controller.allProduct[index].pNome,
                                style: const TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Text(
                                "Valor do produto :",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                controller.allProduct[index].pNome,
                                style: const TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Text(
                                "Detalhes do produto :",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                controller.allProduct[index].pNome,
                                style: const TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
