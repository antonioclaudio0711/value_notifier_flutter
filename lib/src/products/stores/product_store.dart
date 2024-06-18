import 'package:flutter/foundation.dart';
import 'package:value_notifier_flutter/src/products/services/product_service.dart';
import 'package:value_notifier_flutter/src/products/states/product_state.dart';

class ProductStore extends ValueNotifier<ProductState> {
  ProductStore(this.service) : super(InitialProductState());

  final ProductService service;

  Future fetchProducts() async {
    value = LoadingProductState();
    await Future.delayed(const Duration(seconds: 3));
    try {
      final products = await service.fetchProducts();
      value = SuccessProductState(products);
    } catch (e) {
      value = ErrorProductState(e.toString());
    }
  }
}
