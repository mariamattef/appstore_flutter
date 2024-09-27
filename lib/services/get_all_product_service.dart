import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:storeappp/models/product_model.dart';

class AllProductsService {
  Future<List<ProductModel>> getAllProducts() async {
    try {
      http.Response response =
          await http.get(Uri.parse('https://fakestoreapi.com/products'));
      print('Response status:>>>>>>>>>>>>> ${response.statusCode}');
      print(
          'Response body: >>>>>>>>>>>>${response.body}'); // Debug the response body

      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        List<ProductModel> productList =
            data.map((item) => ProductModel.fromJson(item)).toList();
        return productList;
      } else {
        throw Exception(
            '>>>>>>>>>>>>Error in status code: ${response.statusCode}');
      }
    } catch (e) {
      print('>>>>>>>>>>>Failed to fetch products: $e');
      throw Exception('>>>>>>>>>>>>>Failed to load products');
    }
  }
}
