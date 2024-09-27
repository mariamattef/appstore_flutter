import 'package:storeappp/helper/api.dart';
import 'package:storeappp/models/product_model.dart';

class UpdateProductService {
  Future<ProductModel> updateproduct(
      {required String title,
      required String price,
      required String image,
      required String desc,
      required int id,
      required String category}) async {
    print('Product id >>>>> $id');
    Map<String, dynamic> data =
        await Api().put(url: 'https://fakestoreapi.com/products/$id', body: {
      'title': title,
      'price': price,
      'image': image,
      'category': category,
      'description': desc,
    });

    return ProductModel.fromJson(data);
  }
}
