import 'package:uno/uno.dart';
import 'package:value_notifier_flutter/src/products/models/product_model.dart';

class ProductService {
  ProductService(this.uno);

  final Uno uno;

  Future<List<ProductModel>> fetchProducts() async {
    final response = await uno.get('http://10.0.2.2:3031/products');
    final list = response.data as List;
    final products =
        list.map((element) => ProductModel.fromMap(element)).toList();

    return products;
  }
}
