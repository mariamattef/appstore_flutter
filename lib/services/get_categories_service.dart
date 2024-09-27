import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:storeappp/models/product_model.dart';

class CategoriesServices {
  Future<List<ProductModel>> getCategoriesServices(
      {required String categoryName}) async {
    http.Response response = await http.get(
        Uri.parse('https://fakestoreapi.com/products/category/$categoryName'));
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      List<ProductModel> productList = [];

      for (var i = 0; i < data.length; i++) {
        productList.add(ProductModel.fromJson(data[i]));
      }
      return productList;
    } else {
      throw Exception(
          'There is an Error in status code : ${response.statusCode}');
    }
  }
}
