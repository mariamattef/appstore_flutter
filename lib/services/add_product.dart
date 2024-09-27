import 'package:storeappp/helper/api.dart';
import 'package:storeappp/models/product_model.dart';

class AddProduct {
  Future<ProductModel> addproduct(
      {required String title,
      required String price,
      required String image,
      required String desc,
      required String category}) async {
    Map<String, dynamic> data =
        await Api().post(url: 'https://fakestoreapi.com/products', body: {
      'title': title,
      'price': price,
      'image': image,
      'category': category,
      'description': desc
    });
    return ProductModel.fromJson(data);
  }
}
