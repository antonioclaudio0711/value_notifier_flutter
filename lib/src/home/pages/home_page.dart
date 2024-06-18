import 'package:flutter/material.dart';
import 'package:value_notifier_flutter/src/home/controller/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final _homeController = HomeController();
  // int get _incrementVariable => _homeController.counter;

  // final _homeController = HomeController();
  // int get _incrementVariable => _homeController.counter;

  final _counter = Counter();

  // @override
  // void initState() {
  //   super.initState();

  //   _homeController.addListener(() {
  //     setState(() {});
  //   });

  //   _homeController.counter$.addListener(() {
  //     setState(() {});
  //   });

  //   _counter.addListener(() {
  //     setState(() {});
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        title: const Text('ValueNotifierApp'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Quantidade de vezes que o FloatingActionButton foi acionado:',
            ),
            const SizedBox(height: 15),
            ValueListenableBuilder<int>(
              valueListenable: _counter,
              builder: (context, counter, widget) {
                return Text(
                  '$counter',
                  style: Theme.of(context).textTheme.displayLarge,
                );
              },
            ),
            // AnimatedBuilder(
            //   animation: _counter,
            //   builder: (context, widget) {
            //     return Text(
            //       '${_counter.value}',
            //       style: Theme.of(context).textTheme.copyWith().displayLarge,
            //     );
            //   },
            // )
            // Text(
            //   '$_incrementVariable',
            //   '$_incrementVariable',
            //   '${_counter.value}',
            //   style: Theme.of(context).textTheme.copyWith().displayLarge,
            // )
            const SizedBox(height: 50),
            const Text('Ir para tela de produtos'),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/products/');
              },
              child: const Icon(Icons.production_quantity_limits),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:
            // _homeController.increment,
            // _homeController.increment,
            _counter.increment,
        child: const Icon(Icons.add),
      ),
    );
  }
}
