import 'package:flutter/material.dart';

// ignore_for_file: avoid_print
void main() {
  runApp(const MyApp());
}

/*
    ! Generators
      * For generating "iterables", marked with sync* and async*
*/

// * Function returns 1,2,3
List<int> getOneTwoThreeUsingList() {
  return [1, 2, 3];
}

Iterable<int> getOneTwoThreeUsingIterable() sync* {
  yield 1;
  yield 2;
  yield 3;
}

void generatorTest() {
  for (final value in getOneTwoThreeUsingIterable()) {
    print(value);
  }
  print(getOneTwoThreeUsingIterable());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    generatorTest();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
