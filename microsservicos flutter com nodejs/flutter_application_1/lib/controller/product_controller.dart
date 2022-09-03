import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../model/product_model.dart';

class ProductController extends GetxController {
  static const apiBaseUrl = 'http://192.168.0.18/api/';
  //static const apiBaseUrl = '';

  List<ProductModel> allProduct = [];

  Future<void> createproduto(Map productData) async {
    print("adicionar dados do produto $productData");

    var url = Uri.parse('${apiBaseUrl}createproduto');

    try {
      final response = await http.post(url, body: productData);
      if (response.statusCode == 200) {
        print(json.decode(response.body));

        var res = json.decode(response.body);
        print(res['code']);
        Get.back();
      }
    } catch (error) {
      print(error);
    }
  }

  getProduct() async {
    allProduct = [];
    var url = Uri.parse('${apiBaseUrl}getproduto');
    List<ProductModel> helperList = [];
    try {
      final response = await http.get(
        url,
      );

      if (response.statusCode == 200) {
        var productResponse = json.decode(response.body);

        productResponse['productData'].forEach((result) => {
              helperList.add(ProductModel(
                  pNome: result['pNome'],
                  pValor: result['pValor'],
                  pDetalhes: result['pDetalhes']))
            });
      }
      allProduct.addAll(helperList);
      update();
    } catch (error) {
      print(error);
    }
  }
}
