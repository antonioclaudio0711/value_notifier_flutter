import 'package:flutter_modular/flutter_modular.dart';
import 'package:uno/uno.dart';
import 'package:value_notifier_flutter/src/products/pages/product_page.dart';
import 'package:value_notifier_flutter/src/products/services/product_service.dart';
import 'package:value_notifier_flutter/src/products/stores/product_store.dart';

class ProductsModule extends Module {
  @override
  void binds(Injector i) {
    i
      ..add<Uno>(Uno.new)
      ..add<ProductService>(ProductService.new)
      ..add<ProductStore>(ProductStore.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      '/',
      child: (context) => ProductPage(store: context.read()),
    );
  }
}
