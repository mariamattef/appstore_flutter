import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:storeappp/models/product_model.dart';
import 'package:storeappp/services/update_product.dart';
import 'package:storeappp/widgets/custom_field.dart';
import 'package:storeappp/widgets/custom_elevated_button.dart';

class UpdateProductPage extends StatefulWidget {
  static String id = 'UpdateProductPage';
  UpdateProductPage({super.key});

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? productName, desc, image, price;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          elevation: 0,
          title: const Text(
            'Update Product',
            style: TextStyle(),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
                CustomField(
                  label: 'Product Name',
                  onChanged: (data) {
                    productName = data;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomField(
                  label: 'Description',
                  onChanged: (data) {
                    desc = data;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomField(
                  label: 'Price',
                  onChanged: (data) {
                    price = data;
                  },
                  texInputType: TextInputType.number,
                ),
                const SizedBox(
                  height: 10,
                ),
                const CustomField(
                  label: 'Image',
                ),
                const SizedBox(
                  height: 50,
                ),
                CustomElevatedButton(
                  label: 'Update',
                  onPressed: () async {
                    isLoading = true;
                    setState(() {});
                    try {
                      await updateProduct(product);
                      print('success');
                    } catch (e) {
                      print('>>>>>>>>>>>>>>>>>>>>>${e.toString()}');
                      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      //   content: Text('faild Update Product ${e.toString()}'),
                      // ));
                    }
                    isLoading = false;
                    setState(() {});
                    Navigator.pop(context);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> updateProduct(ProductModel product) async {
    await UpdateProductService().updateproduct(
      id: product.id,
      title: productName == null ? product.title : productName!,
      price: price == null ? product.price.toString() : price!,
      image: image == null ? product.image : image!,
      desc: desc == null ? product.description : desc!,
      category: product.category,
    );
  }
}
