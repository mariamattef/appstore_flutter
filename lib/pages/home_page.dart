import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:storeappp/models/product_model.dart';
import 'package:storeappp/pages/update_product_page.dart';
import 'package:storeappp/services/get_all_product_service.dart';
import 'package:storeappp/widgets/custom_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static const String id = 'HomePage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('New Trend'),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(FontAwesomeIcons.cartPlus),
            )
          ],
        ),
        body: Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, top: 120),
            child: FutureBuilder(
                future: AllProductsService().getAllProducts(),
                builder: (ctx, snapshot) {
                  if (snapshot.hasData) {
                    List<ProductModel> products = snapshot.data!;
                    print(snapshot.hasData);
                    return GridView.builder(
                        itemCount: products.length,
                        clipBehavior: Clip.none,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 100,
                                childAspectRatio: 1.4),
                        itemBuilder: (context, index) {
                          return CustomCard(
                            product: products[index],
                          );
                        });
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                })));
  }
}
