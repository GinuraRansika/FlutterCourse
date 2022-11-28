import 'package:flutter/material.dart';

// ignore_for_file: avoid_print
void main() {
  runApp(const MyApp());
}

// ! Extension
class Cat {
  final String name;
  Cat(this.name);

  /*
    * Let's say we want to add Run Functionality to this cat class
      ? One to do that is create a method called Run
      ? we can use extension way
  */
}

/*
  * In here we are extending the class called Cat with new functionality that is called Run
  * that is now the name of the function it's just the name of your extension 

  * extension is a great tool for you to use
    ? if you believe that there is a functionality that you're adding to an existing class
    ? which it doesn't really belong in that class but it may belong in the current source file
*/
extension Run on Cat {
  void run() {
    print("Cat $name is running");
  }
}

void test() {
  final meow = Cat("Kitty");
  print(meow.name);
  meow.run();
}

/*
  * Extension Example For Person Full name
*/
class Person {
  final String firstName;
  final String lastName;

  Person(this.firstName, this.lastName);
}

extension FullName on Person {
  String get fullName => "$firstName $lastName"; // * Getter
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    test();
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
