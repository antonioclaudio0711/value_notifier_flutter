import 'package:value_notifier_flutter/src/products/models/product_model.dart';

abstract class ProductState {}

class InitialProductState extends ProductState {}

class SuccessProductState extends ProductState {
  final List<ProductModel> products;

  SuccessProductState(this.products);
}

class ErrorProductState extends ProductState {
  final String message;

  ErrorProductState(this.message);
}

class LoadingProductState extends ProductState {}
