import 'package:flutter/material.dart';

// ignore_for_file: avoid_print
void main() {
  runApp(const MyApp());
}

/*
    ! Generics
      * To avoid re-writing similar code 
*/

class PairOfStrings {
  final String value1;
  final String value2;
  PairOfStrings(this.value1, this.value2);
}

class PairOfIntegers {
  final int value1;
  final int value2;
  PairOfIntegers(this.value1, this.value2);
}

// * Instead of creating again again like above we could create a class that is generic
// * between <> we add data types with a single Letter
class Pair<A, B> {
  final A value1;
  final B value2;

  Pair(this.value1, this.value2);
}

void genericsTest() {
  final stringString = Pair("Ginura", "Ransika");
  final stringInt = Pair("Ginura", 150);
  final intInt = Pair(12, 15);

  print(stringString);
  print(stringInt);
  print(intInt);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    genericsTest();
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
