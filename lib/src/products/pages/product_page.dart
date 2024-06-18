import 'package:flutter/material.dart';
import 'package:value_notifier_flutter/src/products/states/product_state.dart';
import 'package:value_notifier_flutter/src/products/stores/product_store.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key, required this.store});

  final ProductStore store;

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  ProductStore get store => widget.store;

  @override
  void initState() {
    store.fetchProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        title: const Text('Página de produtos'),
      ),
      body: ValueListenableBuilder(
          valueListenable: store,
          builder: (context, state, widget) {
            if (state is LoadingProductState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ErrorProductState) {
              return Center(child: Text(state.message));
            } else if (state is SuccessProductState) {
              return ListView.builder(
                itemCount: state.products.length,
                itemBuilder: (context, index) {
                  final product = state.products[index];
                  return ListTile(title: Text(product.title));
                },
              );
            }

            return Container();
          }),
    );
  }
}
