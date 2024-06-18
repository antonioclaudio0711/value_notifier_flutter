import 'package:flutter_modular/flutter_modular.dart';
import 'package:value_notifier_flutter/src/home/home_module.dart';
import 'package:value_notifier_flutter/src/products/products_module.dart';

class AppModule extends Module {
  @override
  void binds(Injector i) {}

  @override
  void routes(RouteManager r) {
    r
      ..module('/home', module: HomeModule())
      ..module('/products', module: ProductsModule());
  }
}
