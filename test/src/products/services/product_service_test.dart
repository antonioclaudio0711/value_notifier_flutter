import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:uno/uno.dart';
import 'package:value_notifier_flutter/src/products/services/product_service.dart';

final jsonResponse = jsonDecode(r'''
  [
    {
        "id": "0",
        "title": "Flutter 2"
    },
    {
        "id": "1",
        "title": "React Native"
    },
    {
        "title": "Ionic",
        "id": "2"
    }
]
''');

class UnoMock extends Mock implements Uno {}

class RequestMock extends Mock implements Request {}

void main() {
  final unoMock = UnoMock();
  final requestMock = RequestMock();
  final service = ProductService(unoMock);

  test('fetchProducts', () async {
    when(() => unoMock.get(any())).thenAnswer((_) async {
      return Response(
        headers: {},
        request: requestMock,
        status: 200,
        data: jsonResponse,
      );
    });
    final products = await service.fetchProducts();
    expect(products[0].title, 'Flutter 2');
  });
}
