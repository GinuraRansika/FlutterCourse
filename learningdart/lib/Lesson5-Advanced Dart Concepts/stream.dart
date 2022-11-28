import 'package:flutter/material.dart';

// ignore_for_file: avoid_print
void main() {
  runApp(const MyApp());
}

/*

  ! Stream
    * An asynchronous "pipe" of data
     as an example : time that display on top of the screen on the right hand corner
     that is a stream of strings
     * it is a stream because it doesn't have an end (continuos pipe of information)
*/
Stream<String> getName() {
  // * You can't just return a String you have to create a stream of String
  return Stream.value("Ginura");
  // * what above means you have a pipe of data but only value it contains is "Ginura"
}

//? with a data set
Stream<String> getDataSet() {
  return Stream.periodic(const Duration(seconds: 1), (value) {
    return "Foo";
  });
}

void streamTest() async {
  // * awaiting for values in getName()
  await for (final value in getName()) {
    print(value);
  }

  await for (final value in getDataSet()) {
    print(value);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    streamTest();
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
