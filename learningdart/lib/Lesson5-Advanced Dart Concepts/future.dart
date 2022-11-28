import 'package:flutter/material.dart';

// ignore_for_file: avoid_print
void main() {
  runApp(const MyApp());
}

// ! Future
/*
  * Data to be returned in the future
  * asynchronous operations

  ex:
    ? Future<data type it contains> 
*/

Future<int> heavyFutureThatMultiplyByTwo(int a) {
  // * inside of the delayed(delayed time, function that need be called after the delay)
  return Future.delayed(const Duration(seconds: 3), () {
    return a * 2;
  });
}

/*
    ! async / await
    * In order to use future you need to know async and await in dart 
    * Mechanism for controlling asynchronous flow of data

    ? async - it is a key word in dart that marks a function as asynchronous 
      * So marking a function as async means that this function internally
      * calls other functions that do asynchronous work 

    ? await - it is used to get the data back from a future function
      * it wait for the result of this function to be calculated and then it's gonna go the next line 
*/
void futureTest() async {
  final result = await heavyFutureThatMultiplyByTwo(10);
  print(result); // * will return Future
  /*
    ? what happens is when you call a function that returns a future you are actually 
    ? getting the future back you are not getting its data back;

    * TO ge that data back you can prefix that function with await

  */
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    futureTest();
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
