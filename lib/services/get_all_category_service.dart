import 'dart:convert';
import 'package:http/http.dart' as http;

class CategoryServicesP {
  Future<List<dynamic>> getAllCategories() async {
    http.Response response = await http.get(
      Uri.parse('https://fakestoreapi.com/products/categories'),
    );
    if (response.statusCode == 200) {
      List<String> data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception(
          'There is an error in status code : ${response.statusCode}');
    }
  }
}
