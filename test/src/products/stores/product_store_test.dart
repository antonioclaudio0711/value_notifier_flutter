import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:value_listenable_test/value_listenable_test.dart';
import 'package:value_notifier_flutter/src/products/services/product_service.dart';
import 'package:value_notifier_flutter/src/products/states/product_state.dart';
import 'package:value_notifier_flutter/src/products/stores/product_store.dart';

class ProductServiceMock extends Mock implements ProductService {}

void main() {
  final service = ProductServiceMock();
  final store = ProductStore(service);
  test('change app state to SuccessProductState', () async {
    when(() => service.fetchProducts()).thenAnswer((_) async {
      return [];
    });

    await store.fetchProducts();

    expect(store.value, isA<SuccessProductState>());
  });

  test('change app state to ErrorProductState', () async {
    when(() => service.fetchProducts()).thenThrow(Exception());

    await store.fetchProducts();

    expect(store.value, isA<ErrorProductState>());
  });

  test('describe success app state cicle', () async {
    when(() => service.fetchProducts()).thenAnswer((_) async {
      return [];
    });

    expect(
      store,
      emitValues([
        isA<LoadingProductState>(),
        isA<SuccessProductState>(),
      ]),
    );

    await store.fetchProducts();
  });

  test('describe failure app state cicle', () async {
    when(() => service.fetchProducts()).thenThrow(Exception());

    expect(
      store,
      emitValues([
        isA<LoadingProductState>(),
        isA<ErrorProductState>(),
      ]),
    );

    await store.fetchProducts();
  });
}
