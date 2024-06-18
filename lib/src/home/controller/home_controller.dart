import 'package:flutter/material.dart';

// class HomeController extends ChangeNotifier {
//   var counter = 0;

//   void increment() {
//     counter++;
//     notifyListeners();
//   }
// }

// class HomeController {
//   var counter$ = ValueNotifier(0);

//   int get counter => counter$.value;

//   void increment() => counter$.value++;
// }

class Counter extends ValueNotifier<int> {
  Counter() : super(0);

  increment() => value++;
  decrement() => value--;
}
